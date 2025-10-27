Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE92C0DA0B
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1310E008;
	Mon, 27 Oct 2025 12:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1r/83dx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BDF10E469
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RCLHvH2752664
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=; b=N1r/83dxtRdH1PdG
 ld+vkrqOaa2GEiTAQUHgYE1tyMwJu3czrggpwQVCcOPbPbOcGSYZUofUgMs5Fox/
 o2F4/lpx/IkAe01l7HeFUzg69lLC32wCuDWwXr9rz6LxvSakesAojLTmf+XNbG2U
 aCv6gFavGvdqJsF0sxMrQPDPg6gSi1peGzsLhkAWN7SJgMXgVdUXyQSaeJByFY4R
 w1G9Vca4fBrpBtvOGyoD/ftKpEbjR2Buh+9A8nGonT/ZLbllZhIO3eR/Fx9h64Dx
 741FCKNv8sEa4hAOe4UrTw4XCuNwo18YSleuJ17FV1bmWGxuMqYuXrVlKmY+EFZO
 BUS5Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsr201-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e887bef16aso7957521cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568989; x=1762173789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=;
 b=H5cI+2opFfyjqjcMlTrhsjYQ1HDDXHSaQOJrYG/jISDW8ojDFISeI6HdISJJ6/yoPP
 vzaDUD5/VRpF0sY8VomNhRilyM6CHzdidfM2fDRZ7w1c+QLJTsrFiDBkhnHCoDORAS0d
 LCd1T2UC9J5wMuNIFJwOF/PpQG1w0mN11SEM8k51m1Em9N9ll06wsFOftmKNkNhtpQhw
 hHgD93Zz2uYjj/CeGfFzDFUE/irTyagK3+PvBg5f36ccj0j2EIFWuNgjBa+izZcw4A+6
 rq/BkI64ShlfIYq9Dvo4oEjsQPUNm74YerAJmbYIlOeuhx/KKTDa//g7q+MbU5EtbvRK
 fEVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaz+k636z98dOX9YplAsmkQr4/6NDy6+sohE3U5BNcFdEqLq0fJ1tCLLgRqudqcHm/u9DISiR5AjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVRPJMEXl1TuWpvLx2QLIRFVY1W+WFoBsno1i0xhNfjWO6175H
 zBhBKpEpGuouUSvcB8gGxHUd9GC9Hsw42QC8euQzYRGpBRiFmQLPfbJ2TVTWD1kXkk6YdeSSMTw
 bqxI3L6jThuYXYEW2JUPNTedUmkkjD3yHKHZxBgzhca7pU+S10I1jncWN+/sY8GNn+y/XG+0=
X-Gm-Gg: ASbGnctDD6cDIU6cPdoVyDJpuBK5ew2eYMWnX+Y/R6UtMXfqr27Xu/dBgZhNvJ42Rat
 SROr0QxGzYpCD7+HOfy0F6KkzeCSTS/QfM7cAHXgRJgfDNIxp1WWCqFD8oZ1EIi1RNEYwMyXhoj
 btwZ5PZGvoDufashSWRVwsDW9biKMm8DYvslp0nGZ78b/rk8PC9oIZTBWB3hLnvUGHKZo2aj6NV
 66org+LkgWKfbIEcSc6ujkNNo9JtSDPxD2MAPW9kF5ArUk/+er9DcFswcq4jfgXVjLUMfu5quyf
 pttpk9vPdD/1pNgc5dGBGAG/8nwmWr+glPbkvs+qWg/hUadxMnf1oxWLr5HmSGdW6m9mJmwFgyG
 m8zc3z9MOgmBfr+3s3tjgoyr3m4ncPDYtaPfUXdkWA6OYwYbzcBrrgS7b
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4eceec8f9cemr45634401cf.7.1761568989473; 
 Mon, 27 Oct 2025 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1HqeE9MvodZNYXC7WwzDrvESBdzQm1TEemMfGCepQyLUEGzFaK7Rb8u7ydwVzQs3atb4nNQ==
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4eceec8f9cemr45634011cf.7.1761568988857; 
 Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d854763b1sm747106966b.71.2025.10.27.05.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Message-ID: <82971ca7-8f52-4350-947f-309e913a6886@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
 <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
 <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOCBTYWx0ZWRfX6+gfzHbA9/p6
 YUruDT0QEtAPkbSpMeM9uMA9yfAj0ZLXWiqlTnoNMQ7Ee2Oh9nRWlpnr0NO29box7xD3eUoGcxy
 MeD3NCojYIhyQwIxZHXhv1aN9U9fcD8zHXCZEqQuPzmvZbGoXBHoks73OxOQgFoCrHiA0MhfeIx
 h06ldogYkGZix8coQnBKS546XHUXTt2NAzaaUrd/MOqtNsyHSOzvv6RE6tjK0ed1NfH+CRL0HMt
 JHC8L6u/y+IJNmRCtT0bNgwHfZ+jGudvtowJyOV6bSvhSoVXrlfSZ444C3rUfy1zFNhp81m8phX
 KkJg+L8r8QjvTDLP2IMKNThRsuTlyk3JD1zJdvddcViBCXM+E4RRUOCMo5kDXrQHCifkPyLMv4f
 rRhROLQlOEPqUNLnrMTZTi/G3+xmIg==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=68ff68de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=7pKaQVV4AfFCDnn0ZdoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jBZNecM7IpPNROVanNQHC5jMuZEas_is
X-Proofpoint-GUID: jBZNecM7IpPNROVanNQHC5jMuZEas_is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270118
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

On 10/27/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 27/10/2025 13:20, Konrad Dybcio wrote:
>> On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>> should carry respective DAI name prefix regardless.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> ALSA UCM and audioreach topology will follow up as well.
>>> ---
>>
>> [...]
>>
>>>  &mdss_dp0 {
>>> +	sound-name-prefix = "DisplayPort0";
>>
>> We should probably push this into SoC dtsi since #sound-dai-cells
>> is there
> 
> 
> Hm, that's important for user-space and represents actual naming or
> wiring on the board, so it is strictly a board property. IOW, there
> could be a board which does not have DP0, thus mdss_dp1 should be called
> DP0.
> 
> If you are sure that such case does not exist, then indeed we can make
> it shared.

On at least x1e, any of DP012 (not 3) host can be re-routed to any
QMPPHY output, at runtime, so I'd rather keep this bound to the DP host
index.

This is utilized e.g. for USB4 or MST. Or if someone has a fantasy for
remapping their PHY<->DP links for no good reason.

Konrad
