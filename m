Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37959CC2A9E
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 13:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74B10E520;
	Tue, 16 Dec 2025 12:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FeyrEbN6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMOl0vos";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8388610E323
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 12:22:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGBOCLr3390930
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 12:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=; b=FeyrEbN6zn4d7YZm
 WcG6QEWgtvaCjR49tdE1ABh9ziZo5OUx8vAo/PtaBNP91nSRzJxM8aGvruF3hdnW
 fDjnP+EvuX8BD+2R5YAtV56x1d4XNqy0JAF2zFhHFQKuwLnJzDfQ3KO5TMPAnrfW
 iKFPfxwqithxkGsN8k3oOfF+S7jPMlsPRg9eTI1ixVO4sTiz9TuYemLXA1BWP7Ga
 2OILCqvRnKb2dClSL6lzt6kZbVRoW12o9GlsoqrVN6b1l/RyrNsa5AsL74nt0NyZ
 Z8GmEEuvto97RH4lisxgLhL7qHmWaMwFvKAbvQd8EoVViAxzt+jWYlHr8RI2sYAy
 viZhNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b36h386s6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 12:22:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso18208861cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765887771; x=1766492571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=;
 b=LMOl0vosZRSN43kSbAN2Ym+fQqSOU7n1cq5xOyk+2E1xZeNb4Xp6I9T5SWsSIvlDJQ
 aAgLibtNcuFNtuTPZhqxiyZV4xmfSt/yOsBQ3e24DxQOns60lspJO/UE7eUwgeKc4TFs
 dOdTAV53FfL7P93bVkctPq84qxpvu15oT4kOTxCwQOrxKVBraofzsXL45OwVS21Y3BY+
 q2p+qPG8JI26MS1MlqPGOwBbr/j0W8tA3deWjGLnqFB8nAYLDtHOP71yjYXbPMRo03+N
 K4Wj4dBbAbTzumL5mr57cujq/axODSW+NXz9fFGI6I8H6vwReSJJZRqHMP2bq419vyNy
 cBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765887771; x=1766492571;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMHtI/PVMGmr3+qOBljXqmu13wm8WvV0AVBx5b1CeBY=;
 b=PtW/EEv5CxUuSzFFTVxFp3pjkTD1dbJCSaBOcUpIqCMiTDqagNIyYdighwrMgvM3PQ
 ZVKINOtq8Yf+ItTFxBxfgZMckOPzmy9CZJ6G4POl4ctirdo9s+E8V4BAwnuOuF3hBFta
 HXm/+VVs9vXmK6OPTlCeA4PvwpuCMkSRao64UBcTxKwcDpaG6KK0gXvH9fehoOv/MFMz
 VrDyns98ZRTzvfz5n1j+QuAjZuy/3Jd/IeLAjN0QnrZXQSg0ueqlYAAdl+BmLyHdDJIM
 AHmUkx6oSKTK0FaIxjzO7gNbB2Ggbh6Qm0N0Uw3M4Rj1BT6gyupud3K44gOaL17JZsge
 Nxmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQPgbM4WYtFMZVPQMPeisaztax7na8obc3QZ08qiw7Y/aunzea9lqhHUjB3zI0T6gGCqrdRN9SK5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtO+3V7l5zEm5t3V4ljYdPrMgAh3S0akf4N/z90K6XUPWMuEnw
 42/Ub2UPAwFOKnuxb18iBh3IwoIooy4pKxgheusFXol6q7vlv6GuZ4mZOzBDQs+/YNS/gfGrBVf
 Lx0ZAdPf29oHIL/1lHZGyES949MTbK0l4qBxTa5267Lol43qcoWVXnNjTB9BYZ/9h2rBO7x8=
X-Gm-Gg: AY/fxX5wTZoI2cN52VhKZje16v9RsC19cfCOn57AWGctiJnLUId318+D2J3Ll7MzDyz
 E4fdfHGI1c4J0kjhVryTWVDmBZcoZXdpDa6iALU3uLULNl5OFju2YBhkVHf05LzCekjwiG2MCxZ
 UuqrUXlKBCiWdO7Fn+fRFCcOqD7xLmpoPo3qI4WVO6WRcCrq9klRRfismTZMiBbZ5LF131FdeiT
 NXrTMJpkt8Ren19Hu9POHJnMHLptumJ8P8lI+rar9hLGFqsUmdVJ0z4kllk3tnjjpekDJbyxNl0
 PteCaMgYY3bx3wXyQQUPanL6VwkRxsyN7xwr71+6aDnIjH9Gyzq55zFvmawt6zw7zt9BznIlVY5
 22bJR/Kg1DUj1auNM6wfviu55DxzE8pW84MXGw1ZgRGxK+2Lq+xL/IUX+RG3Okejlpw==
X-Received: by 2002:ac8:7d13:0:b0:4f1:be94:a2a8 with SMTP id
 d75a77b69052e-4f1d016f9e8mr134728291cf.0.1765887770955; 
 Tue, 16 Dec 2025 04:22:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO32ZuD9qh2kg30UIDTlpIuFZrAqWeozHmeNB6fHUfkDSEVhrHC+LeEgZZjlPFn9KNPJVkMQ==
X-Received: by 2002:ac8:7d13:0:b0:4f1:be94:a2a8 with SMTP id
 d75a77b69052e-4f1d016f9e8mr134727961cf.0.1765887770473; 
 Tue, 16 Dec 2025 04:22:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5192a2sm1623060066b.36.2025.12.16.04.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 04:22:49 -0800 (PST)
Message-ID: <64995765-485b-42c8-9fef-78d9df899143@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwNSBTYWx0ZWRfX0opNYxvtkn5j
 io/ZX1YE0qRgzPBXuv5XD0PFuloNLDLbpGWDWAfjP7Gv2555ZhouVikXptyQr1Nngr7qAMA+b8P
 3v0IVsSHvo5v0wbaM7QeQTMILekGsU5xDwXi1WxbvNB4JfBN58pcYZSZHODMyHarCdnQykWWxxK
 YbkNBL8akmKg1XyY+8aheuTAqbpe8TVScFnra/v7XUQKfKkEUYqezCB07z31GApbciHfhJSzvIG
 FvEXicbe27JPpvCtEVsDsUHeKTM/BLZywaYIYLzLh4hBf9zJY1T5BO4mUNvqc7nyoxaK3EoFLHd
 emddLtmGvbHsW4Xt3NjGWT5TtZl+Z4wMyt2hwr/qr07C80srsjVNstzWwBxwR4pJlAcm+CA+1qm
 LcQSpbczDqd18ust8AsAhleXO7Yr2g==
X-Proofpoint-GUID: IqcbOOUZz0peOWgxGP_gyD2-v2sKAtCO
X-Authority-Analysis: v=2.4 cv=QeRrf8bv c=1 sm=1 tr=0 ts=69414f1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MoI4cQn0tyS3ZVVy2s4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: IqcbOOUZz0peOWgxGP_gyD2-v2sKAtCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160105
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

On 12/11/25 2:25 AM, Dmitry Baryshkov wrote:
> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> mature enough, so it's no longer sensible to keep them enabled in the
> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> string. Drop support for the MDP5 3.x genration inside the MDP5
> driver and migrate those to the DPU driver only.
> 
> Note: this will break if one uses the DT generated before v6.3 as they
> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> SDM660. However granted that we had two LTS releases inbetween I don't
> think it is an issue.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I wouldn't be surprised if the DPU description was "better" too, since
they've gone through rounds of reviews

FWIW

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
