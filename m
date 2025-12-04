Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52CCA4080
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D5810E1E9;
	Thu,  4 Dec 2025 14:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAPvjm0e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1NhYzxP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1910E1E2
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 14:34:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AErRH1042887
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 14:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=; b=RA
 Pvjm0eIZ/Z2m1XEblDoSmPbwSyCg03lzSi1T1M/MtkoUGB8gSC/ebZ+W59du7tXJ
 f+IEZ0IKLxvcMk0wO5t+hPeBLavyvFfXtHzybITiQoqB1OfkvLhOrnofm/RyGrzQ
 WLEK6MMFgpEILukeeXQEDbo8Pz7ONbVuvL/7uV1rb9kPEsIMPbpnX6o40uIJNUm7
 25bHR12Rpn9B8axJp/taBzzKbEfAGk1TajgK3hwfCPaEKRVyQeYrCH5+IFJrGBn6
 ZMcEs4ZjL9tlJUyx670w+ovUchC3BtHeu/1EvMmEiAgj3ldUMk7Q+wM6ruMZsM5m
 2eAN15SxdcYtnY9jtp1A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp12je-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 14:34:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-453109b60a5so700995b6e.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764858880; x=1765463680;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=;
 b=I1NhYzxPHZaiViWpL5gfNR7q/+4yorUWplsGzqBRCBAMKqr2/ILsI5eCrruljFuQTl
 RWkwWEJuFPw50QHhO/d0IUv56JT4Ogi61DjgzguxNZ0y5I57gl5O/HNRocKTl8ymSsm5
 VUXVoRZiWpHenzg68EWXD1iLTPV8iLRDZQ5iFE3juUK+xlmW7in/HLMyFSnbO7jJHxK3
 XwrmRpPM4ZEG+hAlaskPoQksUrsl7Q6fJw1YRhwlQmxZYlE0ijHnK9HUZPbtFeEiXUt9
 E1D7DewB40FCT5sd7CaPd331LuaDH9cMx603f5vb6S0oSu7k79YkdD+6u2s+e33zBLMU
 HbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764858880; x=1765463680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=;
 b=lwFO4jWDuAYYpjwUjRz3whu72PUBSOXOCoXYcuBxYzkfvmkj9ZW64R7bET43W2EQbA
 NEKPf5KvHoJXYk6KnNJhVCkx3FlUIsbTNcApE6sOZtn89NVPaaD1P34wznHR+j6bdCEx
 a0jJS912q1vSJJxLSbmTihaTdi/VzA44SVIb0Ayl3vJ9359Dh1m/p2v6DE+KmAXKUuzm
 pV76TB2zMPZyJ09SdljVpLLimtqXbcBXMsupq53UNxZ91I2A8aGOA9V9+wRBCP383nSd
 dKB/uViUKKkuUzBl+9kaA7RLl3VHrEgOV91C5qBj6lKAzSiKhZdXMRiWRCzyWTYmDKCp
 lYjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8cL2SqET3s14asSrdSnhrCfyI5Pv33o3MZEIpqFOrj58By884pT/AhTvJxU7qRtp2ySHtzRhvlfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDLqFhkiPBzq/KlOt32TF+Vzao1F1gms2//sAF4bOPQtJfAwk4
 YoXv753LMrPpcXOSFJH/txkH80UrVTLzNq23DyhVerYdT6g4oChN/swU97QMirQeQkUKniUr7N3
 225kY+qZWMieGeOtYkEoNJWDEN5f2IIvOnzkX0RlSr5E9D0aa360wFvfvEoJ2tkknu6o+i/SVQ/
 EFTIzYfAA5SsF+UO79ZCo9U8U87LVdYbIQ02nxflQePRcCtanh55wOpQ==
X-Gm-Gg: ASbGncuP80N7E7LVi0ldR6DdsB8FuJpgBbM34D6nTz9l91V/84i+muhoxJFHcdTTmLN
 5B3oJiU4y/9hJLiGIBcaN9ArkbPY6LM9x0GRcxzP4A/aLRJ6ygDf8796KQGEhq7rI3Xxj40+nrg
 4vI+qj7Jq1eAaTmXrMiia0Uqr8sviVl5mKq2JAWdSFzq97wQOdc/yvOSk3TMz54cyWxQ==
X-Received: by 2002:a05:6808:f07:b0:441:8f74:f34 with SMTP id
 5614622812f47-4536e5baaf4mr3829303b6e.62.1764858880576; 
 Thu, 04 Dec 2025 06:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+0rUHt++eMGPmgb91GGQmUCxZnxzOfu4ye/49vp1JLfq2ba9oxHDbplRL+FsVsADDxBYLFTZFQ/V2ZQ5gRzk=
X-Received: by 2002:a05:6808:f07:b0:441:8f74:f34 with SMTP id
 5614622812f47-4536e5baaf4mr3829267b6e.62.1764858880177; Thu, 04 Dec 2025
 06:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
 <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
In-Reply-To: <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 06:34:28 -0800
X-Gm-Features: AWmQ_bnTCiJGdMF-v40ymD8ufqsngGVM26REo7tOXu1SRLt8H3-DaxTDjnOqlTE
Message-ID: <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=69319c01 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eWtdQdNNt0tD2S8HvpoA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: N22LGWEHO26RjfK_bALfvmYTaIVLLMQk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExOCBTYWx0ZWRfXwn8HU93j9oyj
 PX2JZgCtZN5gh1WKKLvQJkgiTugRdSBhULYQ3X7JlAAZXNiKVG72gJauL3y4k260yenuQi5/h9u
 4xI3eVDVRKQ1ZYN/LmCufus/D/NC8uNKSoJdyEvkUCZxTBOk2uiorDeDC1WmUJ7Rq83iOUHdhpF
 YdzjnRmGDF2fpb8fDaADRwgFkx099W//IM+reFUrYUcmF39vbBAw7PsOm/Es3eJo4Pf5rfcsM1/
 aSJlouD8EWm7Hq9e5Menf9VfHOBYVWLuO0qLX9dxtx6D+wzgB63ct8P7QjIimOjY6vcu/ga0wzm
 ebHhhV1xusRCDtWmbXPnykLr9kYKi7u3+9r7fAQhf5WYtiD4FCf6/XXjF7+im/diIGSidFGlkAt
 IUBpSgA7/LULhj/AtLr8NC2BfhkrpQ==
X-Proofpoint-ORIG-GUID: N22LGWEHO26RjfK_bALfvmYTaIVLLMQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040118
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Dec 4, 2025 at 5:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 12/4/25 2:10 PM, Akhil P Oommen wrote:
> > On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> >> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>> Some GPUs like A612 doesn't use a named register range resource. This
> >>> is because the reg-name property is discouraged when there is just a
> >>> single resource.
> >>>
> >>> To address this, retrieve the 'gmu' register range by its index. It i=
s
> >>> always guaranteed to be at index 0.
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
> >>>  1 file changed, 6 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> >>> index 5903cd891b49..9662201cd2e9 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_b=
lock *nb,
> >>>     return 0;
> >>>  }
> >>>
> >>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> >>> -           const char *name, resource_size_t *start)
> >>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,=
 resource_size_t *start)
> >>
> >> Can we drop this and just use devm_platform_get_and_ioremap_resource()=
?
> >
> > This API seems to lock the io region and fails with -EBUSY if the regio=
n
> > is already in use. I am worried it may regress other chipsets. So, I
> > dropped this idea at the last moment.
>
> Is there any specific platform where this would be an issue?

IIRC we've had this problem before and ended up reverting a similar
change, due to gpucc and gpu overlap

BR,
-R
