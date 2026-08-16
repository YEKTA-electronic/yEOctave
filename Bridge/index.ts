import { spawn } from 'child_process'
import { fileURLToPath } from 'url'
import { dirname } from 'path'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

// Define the function signatures for type safety
interface OctaveFunctionMap {
    fTP: {
        args: [number, number, number] // b (bottom price), x (live price), tp (last calculated tp)
        return: number // updated tp value
    }
    fOrderGen: {
        args: [bottom: number, entry: number, top: number, minAmount: number, balance: number] // b (bottom), e (entry), t (top)
        return: {
            price: number[]
            vol: number[]
        }
    }
}

type OctaveFunctionName = keyof OctaveFunctionMap

interface OctaveResponse<T> {
    success: boolean
    result?: T
    error?: string
}

/**
 * Calls an Octave function with type-safe arguments
 * @param funcName - Name of the Octave function to call
 * @param args - Arguments to pass to the function (type-checked)
 * @returns Promise that resolves with the function result
 */
export async function callOctaveFunction<T extends OctaveFunctionName>(
    funcName: T,
    args: OctaveFunctionMap[T]['args']
): Promise<OctaveFunctionMap[T]['return']> {
    return await new Promise((resolve, reject) => {
        console.log(`Calling Octave function: ${funcName}`)

        const octave = spawn('octave', [
            '--silent',
            '--path',
            __dirname,
            '--eval',
            'fBridge()'
        ])

        const inputData = JSON.stringify({
            funcName,
            args
        })

        octave.stdin.write(inputData)
        octave.stdin.end()

        let outputData = ''
        let errorData = ''

        octave.stdout.on('data', (data) => {
            console.log("data:", data);

            outputData += data.toString()
        })

        octave.stderr.on('data', (data) => {
            console.log("error:", data);

            errorData += data.toString()
        })

        octave.on('close', (code) => {
            if (code === 0) {
                try {
                    const result = JSON.parse(
                        outputData.trim()
                    ) as OctaveResponse<OctaveFunctionMap[T]['return']>
                    if (result.success && result.result !== undefined) {
                        resolve(result.result)
                    } else {
                        reject(new Error(result.error ?? 'Unknown error'))
                    }
                } catch (parseError: any) {
                    console.log('input data', inputData);
                    console.error("octave raw outputData:", outputData);
                    console.error('============');
                    console.error("parseError:", parseError.message);

                    reject(new Error(`Failed to parse Octave output: ${outputData}`))
                }
            } else {
                reject(
                    new Error(
                        `Octave process exited with code ${code}. Error: ${errorData}`
                    )
                )
            }
        })

        octave.on('error', (err) => {
            reject(new Error(`Failed to start Octave: ${err.message}`))
        })
    })
}
