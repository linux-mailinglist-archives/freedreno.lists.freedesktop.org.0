Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8745C0046C
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 11:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CCE10E3B3;
	Thu, 23 Oct 2025 09:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxBvhXIA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAC710E3B3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:36:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6NGcx016465
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K+iM28/6ufZlmOomF1p5E1/bkuTFa6Bw8f1OnjTV6/Y=; b=PxBvhXIASB+Tew5z
 LahhQmxH6wst8V0qUTE1SOLZ+qyg1Ns1EuO374nnKPigUFPguw8M1zXnOPCOm+hj
 FYdSNj0llMpTRgFFzQR/Qoirqy3EB8EJ9e3OM0dceb0YSOhas16XVE8LqFc6hsVW
 3DJEfJlNrZR9Z7w4RWDwm8a7k1U0vF9KVS0IdTrrm8uHZj5LGkftPZ43ide3mn8V
 Fu2BKMPimHQ3yZEp0h0uAnuail5MIj/gJaetzq5EoY1oe0hNbSgfDx7gX7Sk1tuT
 WiINMPjOcX04IcGvJr2Ap+W/M0mK2ys/ksYG7ysTU6mL+ki+03rxUIDHpkz1ftsN
 eN6aIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdfmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:36:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-890921c382eso16470285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 02:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761212206; x=1761817006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+iM28/6ufZlmOomF1p5E1/bkuTFa6Bw8f1OnjTV6/Y=;
 b=QzOw2s0t2LYKp9zluzHaQqSQo2eBbJFfEGScY38DoiiXdB+3VQc9B3NXqJriY3oZAA
 sSAbEMoQ/QmlSozlONW3GLG1Gt6AP8JB85UWOV8N5ZR3e10+KlgyGbGMj+6+vuFxIn25
 XeqCbxNhFw3ksOgqeHzxJ4vgjdn0pIcmqWdHKI6u4mvb06gso5a+UloibJtYU0kNcAuE
 Ol0b8/2sz1cUhJQRv2wEjdnoLl4mOaslxi3WTz/tf3zBHB7C0gEmOJZGa4fnCJj85b1R
 NKRLhaE5tMu3prHwTyz1XCNy+tni+2D14xQHbRWmEB4QEuCEn8RewqFMYvPawZRrFYNc
 hBaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjMIp83cUVlCbye6//4n3GXyCCQU2b7RXySsbEJ2f5SlplC8hwJUJydphj3bMUdGBPbSuQ1nneYUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrHCwkPg/6Yh63CfUTw+J194z0Fp6saQOFaCm9oeUvw72jF3U0
 Kam9HY3g+moFFSc6y9B6QInfESpb6V8kI3+BcV7zLTaiZNqWUZjlAFtFNUlNwFV+12Dw2QT8nAx
 6MpezLvyZXbOQRlaEpC2Bi+Wlkhi80q52wTcz1YJIpDUMxNM1/f9U/4GGISjsmQterThUnsA=
X-Gm-Gg: ASbGncv7q28XZ9XV5UjpkPwIWupPCk42LmyvCEOMY1H5UXa1oJtc8Tvv0BVdwtfOF3T
 OvIoVkolKDthcNwcjbSMzOMEQVkNp1M2WhAZSOGi5KvxoR3KoHUJ/+KiAHDQbp8NMZcQQOqT4b/
 4SmAEelpwU/EUFgvcdXMv8F4WulY5yzwf3JmRBUXMk0ciqRe0Y4DJtJSkpUHW/ewaQB5fDV4l20
 IbyptzexuXhwN17tGZHIEGq0Gi5l9l/rQNDGpHM8G8OSadG/cKh646tZ2ZibZbqRDxC0Q3wpbDY
 bpIGYCaCKAWXQ8dhIFDd9bHoUys4HJ6HNuK1m6xtLOR4U807vE64oHKlPO5Gxk2scnRBtchkytc
 gqeD6PjqiGnJeIobsoZgNMCojvD1ZaiI+Qt3fmddINAbX38iLfp7X55u2
X-Received: by 2002:a05:620a:190e:b0:85a:4bc8:3d2d with SMTP id
 af79cd13be357-890706fe6admr2117633385a.8.1761212206517; 
 Thu, 23 Oct 2025 02:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6mY50FZNSqye8z3osZjKohykPCr4NQ1LXRm9tZBZ3NgHs0Ck4cRYybkcjDjgqxKHupXrKRw==
X-Received: by 2002:a05:620a:190e:b0:85a:4bc8:3d2d with SMTP id
 af79cd13be357-890706fe6admr2117630485a.8.1761212205954; 
 Thu, 23 Oct 2025 02:36:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5147240csm159119066b.73.2025.10.23.02.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 02:36:45 -0700 (PDT)
Message-ID: <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 11:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom, kaanapali-mdss: Add
 Kaanapali
To: "Rob Herring (Arm)" <robh@kernel.org>,
 yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev,
 simona@ffwll.ch, devicetree@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, krzk+dt@kernel.org,
 freedreno@lists.freedesktop.org, neil.armstrong@linaro.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, airlied@gmail.com, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 jonathan@marek.ca, robin.clark@oss.qualcomm.com,
 quic_khsieh@quicinc.com, conor+dt@kernel.org, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
 <176121209123.1694835.2815069098750745260.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <176121209123.1694835.2815069098750745260.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXxDFvY+87Y97A
 tNPGPmEqvvwKX65CnvxONayM7g0yCpFadoCIwKYmnsOC6JfFAc0SWLabe1K0yEdT33pTTyBH94E
 hoHljcyq3T6EXU6mqW3q7TEKZrarBfJBYD1OlAOxcgImVrpqP2ygNI5XzIWLV2uESRWoLg2NxkB
 /magRsK4rzo8pag5pnBiaUEtLHrJ/9ylCmrZ/QGOnANmWLzu9afL/6MgfknrNYmWzHVjn36qTgs
 pjCRGju0oOZRwSoWYFBmMPa2g8Q5xRvlAHQ6+kE7IkNoAOV2T82ltMhceN4pH4QgTLNTaICiTHB
 adG/NJeXzYbC7kOQbJ35LYbbAfmyu7ME/4mXgj7ok1dEwDlRjl7IfbGH48qSih22lssjlQDl4Ts
 GGzxm+oAs+JrqiCjHr5hv4/AWRLsYw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9f72f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Dzlb1FsvM0Gpc3-BMYOvbpv7HzXr42Nn
X-Proofpoint-ORIG-GUID: Dzlb1FsvM0Gpc3-BMYOvbpv7HzXr42Nn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

On 10/23/25 11:34 AM, Rob Herring (Arm) wrote:
> 
> On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> ---
>>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
>>  1 file changed, 298 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
>    26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>

Please do what you did with the other clocks and simply refer to it
as some vague &rpmhcc_xo_clk which doesn't actually need to be defined

Konrad
