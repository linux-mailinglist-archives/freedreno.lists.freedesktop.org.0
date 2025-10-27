Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D02C0D79E
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B0010E462;
	Mon, 27 Oct 2025 12:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh4W2s9i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759C010E460
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R88qx61052055
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=; b=Mh4W2s9iCZTmOG/W
 eiIFJyfeRI84xvhv9CLFGqr7pVww6ukMC+1WntxshoS2QBlBGiyNzZQbab4vU03T
 x2NhEP65/wuehfB0uS64BV2OCCbF+Hp7LTcMjY1KdVxzSDNJkzoKQby8spZ/jNIl
 0Iti/RVC0Af7lX8O450WcUbVPfcXp0OqV9iW4hhffprkXvBlFnmw4nNzinVVT9xf
 AFeisaiUmfGxGbNFKWpgdhJYKxwHABwUXwJ/FAIeXCF3X0DKKJ099YkRBbt10l3C
 LcwEdhew1qtui/XWreVyqvweyydqcBYpFXIzvDDD/zu04WvPLn3k5hY+GrUH5sQl
 Ab9riQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkamhp1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8934ae68aso16913011cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567661; x=1762172461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=;
 b=hegqw+J10tiv2Zh1Z3lHlZrCjQkjr1aG8S+2jNtxAShVY4a2WkLV2fNKEeTAQWao2h
 Nqa5rLKssetpPnOLrFTOAB/9Zq/a3ChxxmnZkiLOhrQzZ73o3t1KPq0lMA9t5zaLYVUd
 /PHDEjYuBIy2ek5pUyoZG5xtH2SGKX4RgpUMRmAKdnoZiOpaDd3nDVz7NQUVTKHbBmPa
 /dE0rbApSCiMLxw0dQrjL3DKMLWmxsklvvaiMVfr4hAOpe5vv6qpMPAW9wE66rG9tK1S
 KJP06je0RugcOGoVPm+9MbHM9MPjO0JjHObzyC3Zu9HglPUSPhmpi5bktW+/p6JZZ9Kv
 uyYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgFD9jwHu9nE9oQFq0C8S0b4uhf3m2eDS4SDE8pd6sNtlb1PQX4bhIZSNh5nhwVgk5q4oA1YKLR8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX0usmGsXK9DqvfuOF8kOW5egSZKi/2VWdD/Nfi/N4NbiSI2Sm
 hy+Ajh1wIR4agyyjDt801xvaE34CtXB+a8Hi9F5v4a/7pRUHQsq5VuQlBNwkM38uymjaEoBgvkS
 O9fBsQkigNmF9xdGDAfpwsmYGmi/R3D69lNavuqAccaKoSA85sl8tOzmuCNTcXgj/NEm71tE=
X-Gm-Gg: ASbGncuiFHVkcc2j7Y7bUGPvbnq3TBZEtlrOuO8LfvlKXcQRNH7P/ASGGjd5JhQAWDF
 MGeVFCaTX7rSbO4T9kDECZmo1pmQ4F0wFQUCsiIbN3Kx8lEdrqEl7gusbuW03ui9cx91pwH+M3P
 wB4abXq1xGoWVNnIRNGP+/Sa1dZHjCws9LCnXVjbXYEO+lJuNB08cvc172oYSnMwTouYcpnXEz5
 9kArmMIpPDqz8kXvkwcJLE+rQp2eKp5snRIjcoC+0kl6JuXgl4nmUedOBl4V5u3anDtSRAMOtgS
 OZftuhanGMsns4KhX5sD7h2AtWgzvtYYEkx+BOGqUKsiwYfdud/pq8X1NRUcCDAXokEvzcim+oM
 tWCuJx3kH+Tf1cT4cirpuUw5ZzbUR4neCNzqAYN1NBrfjRFyAxQEOgHTE
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4eced46b36dmr54348731cf.9.1761567660972; 
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Ymwp4j4U76wtRZGQW8EHbN2uGqMPPJ/w80E3/mCrIAWR0RdpJNVmK9Zxy1Lr+Yj9F1bPnQ==
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4eced46b36dmr54348351cf.9.1761567660538; 
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f9a0fsm746527466b.50.2025.10.27.05.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Message-ID: <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:20:56 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68ff63ad cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=PIn3yDVZNjJHwrb619wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6p6Gq3YPVpXBFMxbJ3be9nYsGXtQuqLP
X-Proofpoint-GUID: 6p6Gq3YPVpXBFMxbJ3be9nYsGXtQuqLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNCBTYWx0ZWRfX8KO+2JtuIjL/
 NCkcPIO6fAOudgQpq/WuaqrsXTzQ8emmIrAz9mVHmsge472SJPknyYZ6WORyKQATPsRQ/ijn+Ru
 1J227jE4njMIMmt/Fp36MeRDRbohvN/IRsmBvpD7xryCszxEh9OAiNocbnKaFCOL0ln2YXohE+a
 L9oZ4f0CnSYtd+U7bAxofuVR1hxHX9VaasHJkMkKxCVOFUMtmKfKsfR6dsiBPmYv82RJ/3xYwkO
 le3psV0A6bvHl8d9k++JyYGwILSxxDEjxWknEBCAxvWSCi0olylgpq74oCHjNmVWQ3jU9htM4Qf
 ZAHko4efwrnDaWO3j/EQcv44lCsVQgsuoF4JtVmfFLIr+OHpChVLUMGHTHu2QbGyLrZBdQH3lTq
 sL6JQqlNanEwpiX9PAHGIOlMwxpx8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270114
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

On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> ALSA UCM and audioreach topology will follow up as well.
> ---

[...]

>  &mdss_dp0 {
> +	sound-name-prefix = "DisplayPort0";

We should probably push this into SoC dtsi since #sound-dai-cells
is there

Konrad
