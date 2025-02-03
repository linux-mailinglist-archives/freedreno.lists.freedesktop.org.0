Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C632FA257E3
	for <lists+freedreno@lfdr.de>; Mon,  3 Feb 2025 12:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A469410E474;
	Mon,  3 Feb 2025 11:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bAQEBcD4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1F810E474
 for <freedreno@lists.freedesktop.org>; Mon,  3 Feb 2025 11:16:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so6496705e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 03:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738581413; x=1739186213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ozyTlPLnaugnaEoHQY+R4AXQEUzCLS18GW7s5hKxc5M=;
 b=bAQEBcD4ZfgIDhPBZ+9nMcm2AaTgDyCD81pho97rfaum5mlvydyOtyU56AUFl3Sqoc
 QjxrxV2kngrGI5K1AN70VuptAV0JtpMniIEAgPResNPThYwDoi0mA9lgY+bJxAsV5alf
 tPiMIBj3qrT+xCyc8sqpQY3jGDLjVhjmGVUfx5MVwcFy6CyHSdOQWuNowLcKulucrkzy
 Vyn6iLK1ghcWfpdV9hfC0lGRRHO6KU/pm6Q6iLsRJpj6uG7q57QfvvLc0XaMCp38yEp3
 Wfy0klItSfhGvE2Xo/ETKzKuoRMx2caYzuz8uWNrTMeMyvIRIleUw9kE29z8BDgCavWE
 6Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738581413; x=1739186213;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozyTlPLnaugnaEoHQY+R4AXQEUzCLS18GW7s5hKxc5M=;
 b=cBv6gSZvUkuFN91lq8CDuuKcqaOPFvR7HntqAd9FD7jWhkDvycGi0zWNM19Q6Br8YJ
 S2zjCYel0FC+A8t5BB8U90JBxNkrrBorOIzgwC30c/FjiTLJXQa5MqyKHIhSkt9gdp60
 ZMs7ixgbso+A2+CmITlRTEDX398W1ejWAB6pgohGp02dptX2Gw2UYRUtaIvSn8W1oQpZ
 5ZU/hflZUOMdm0bFWBt1SL/f+kxa59FF6auAszeeA5M+t6jnLiFBURy6kDnsqWg55TtB
 uGoEelOOidSSWqAdFXdMrMmqcFeQh27evVp9G3aFPB+q8HgryNO0rdh3jS8oO0OGEjTW
 3cVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJcU/sNkyFevua/NKPa6SW0/+QwPvZEuoOuAXrPG4S4/Hu35nTZP+VoxshXbC/o45S1FydCNa9l4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhYBgN/tNBoWLpSuPlPTQltMvKKSi7VFT8n8Pe0qteQajvwBOG
 YuMYdhmGlktAwb77ADGwCD+19TPqqfIIX9+Hsgy4ilRLqNmv9FECgIAOBF3UOzE=
X-Gm-Gg: ASbGncvlvIX6QNeLk9cN2xpVKgYDmFncOClVdOAcnteboHyPt6E3CgQvSV7Ogb7d3tD
 8wZ9adCRQ+U6TwQK6fzFDzo9yJ+RptelaBVahy0K2124RA2ls6jj73nGkWxPRoQAXWme4N0inV1
 g8jpJaHrk7H758YcPRlmpCq2a6zlcxHvDPnFYlbi91CYzMkwZ1hUD+V3FxOwq+VujSt8ZDdGUO5
 qJWx2vTmVp4VNg97zttnFUQUt6hz7W7uY/+X2qcPUCTSIsGemk7fH0ffK25E63S+bVtkCxWDvsy
 lw8dJF4MEeYWmt1MOvt3nN0OCf/m+G5o5hY=
X-Google-Smtp-Source: AGHT+IER4b8x4k4tSsG3NXSbXAj/U65SZ2uRmU7FJsNnr3cP55/fxC2eGPVEdqHi8nEykzMTwVK4eg==
X-Received: by 2002:a5d:6d86:0:b0:38b:eb86:694c with SMTP id
 ffacd0b85a97d-38c5167a2cfmr6601607f8f.0.1738581412780; 
 Mon, 03 Feb 2025 03:16:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57b6sm12487667f8f.72.2025.02.03.03.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 03:16:52 -0800 (PST)
Message-ID: <ab65d951-7d1e-436e-8bcd-5b389991a0ef@linaro.org>
Date: Mon, 3 Feb 2025 12:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/01/2025 17:24, Dmitry Baryshkov wrote:
> On Fri, Jan 31, 2025 at 04:02:49PM +0100, Krzysztof Kozlowski wrote:
>> Calling these improvements, not fixes, because I don't think we ever hit
>> actual concurrency issue.  Although if we ever hit it, it would be very
>> tricky to debug and find the cause.
> 
> All of the patches miss Fixes: tags.  Could you please provide those.


I did not provide on purpose, but I don't mind calling these commits
fixes. Will do  in v2.


Best regards,
Krzysztof
