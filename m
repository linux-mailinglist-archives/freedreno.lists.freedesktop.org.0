Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1DAD0FAA
	for <lists+freedreno@lfdr.de>; Sat,  7 Jun 2025 22:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84510E438;
	Sat,  7 Jun 2025 20:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWBtNL/w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981D410E431
 for <freedreno@lists.freedesktop.org>; Sat,  7 Jun 2025 20:14:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557FLrZe006720
 for <freedreno@lists.freedesktop.org>; Sat, 7 Jun 2025 20:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=neSEr4Vb10TXp2iyqI1V1pKk
 tA2cv81JEUUM8szWa8Q=; b=aWBtNL/wBLh7CzJ6ADsTcd6RZes+GaWM9LycJcLq
 C7Jz4+8RJe8RokAt8cHhZbC99Sc4sCvW25ZKoTUthmsXUo486GQvgMCGpPNJs7OD
 eOdlhGb4RgKYbOexm82vfpwVDVH8b2VVGEHf97jUZBd2fbtVw2g42uLrUiSdUxxA
 X1N1yxLutj18RPuwltXnToYvs9w8ZI5B5g/fh4+DlEooQepkt3AxS/0FvPHux1XW
 CRWYhppRcI6mFcB930+ZjmYG5eRtMJkCYiitb1pxlJahvDvTV3FROEWZMnz3SotO
 aaXj1Z64Xt4i7x6ECtaPNKIzwQEh2HjpoRnI0PP4e4d89w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqc8x5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 20:14:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5bb68b386so943016185a.3
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749327267; x=1749932067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=;
 b=jv0TZOQV1jjjsSYwvDttjPl0h9Ll/RSKLHtFgidYKGzB5vCsgzFOAzOiyuwEwFLUWz
 OEwSoyyyD8JQk12Kt9gXsvTHQZGxFMv12YdCsMa2EEt+xXOeSZFSS/kHFVHrO62W5gwH
 FRjIa7eP7Cw5oCNn3qHmkQW9Uuf47R06oOiHUVr5+WuUt3TGyvAckRY7DHf2t84pgxRM
 HA5XqqGbMH7VZyX/ifthausIAM4RgXjNnlWH1UurvKORbOKLb6UbfGzC+2XtfzFyqQ/g
 etQBWXD3RbzWAAKksTSM2vwUTRJeFbfuN4mwK8lBATZ3UpY9nkQsfmFQFZym8Yx7IJwW
 wO2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+dVuSAMcb7EUOmNjL1gqeT3bfhzfXIq0xZc2eWk4Lf7haqQZXvyuZ0G0W+fmKPXyb4rRsdnbaWL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpAmaQUvwoJpe24xIA/tSbvnGogzOaMqqrDZHp+hxATD5Qjh2g
 8b8ClzOcXYda2kqUG9RPQW5K49t7ahMxIycm5T5KB/oxY2ChFSCAqwNTGLagQgt+OVjpO9iv38p
 gcgIYWEuoBgG4DADtiPwR1/fZ0klOVT+V6G40uaWZliz8PzhufVNsr/jrk53QO222eJm3RUs=
X-Gm-Gg: ASbGncuPv642d197/SaBfOb5oJtFs1ZlMYi5rHw1GBvvDJEGbOQLl5dVqcecUG1Aobz
 qRH724idqADIxeLowUuXkSK2+2o/2gjYhkv7oWL6gZz81LT+zDFmubcCD6xpfpWj5aE7p3ZVmxv
 cr1AwtYCebhioya/vlJIe4mBmq9QR1fLwRogTaYmzYZj85/OOyQT+zue/sx7nbFE8/upXIYfNmb
 XniAi0xretiOQSSJ6WiTSI+gtGgGbZtrZJQCdedaumZWdJdKKik0jLtVZQmiqxVp7jSaKI/16o8
 PbtxsYKwZ0QLwTdSfA0RGVgCkifKEzkd0XuWksGq6ylvNq/1pN5cyla4rxWi0xt4DWcQ0ttqdSg
 =
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id
 af79cd13be357-7d229895ca3mr1050769285a.28.1749327267610; 
 Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCuag0taTHrzm6R/+ZyR5VGeUYcsVJcuUbo2+TlgX3IAKr2Foit53gWXRD7B4X3LAeA0xVTA==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id
 af79cd13be357-7d229895ca3mr1050767785a.28.1749327267232; 
 Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b0cf7fsm5606531fa.12.2025.06.07.13.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 13:14:25 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Message-ID: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX5GgtbfnEnw1E
 bDr5M2z6sP95AEwSZ5mJ2TC7SYex33yRZSEvYIffOMfIEPRG/3ynzRZonnUXyjzWoG8CiAkduQd
 bZBmPbw0foFqhEfZFs06r/2dBsSXeqSo/0wNsE+7/78qmoynEWzUa4HOnE1J9k9mtJwMIW9Xpap
 E4p5TvSpNQst1KCrzu/BsmdWPsFE2fT445qBe7wArp6s+6KgE78eUZpdAotE3V9Wy9HfbeUWTek
 5p6U65MvBCzVQuKJHZU7KClgQORWi66XIV2Qzk2WYZJq7z0tZtdV7ro1KJfVuRlLP+/RBhXVwrL
 KcLhLWwNCf8V303qqHEQh2Tp8Fh3wadq+S7y4aJPZfd8cko+Eeo59iMTNQa8H9YyKMgoKxp4ext
 2DCAKepdtid45TY3rW8gpvU9utUrCM4VjFoZfmOmcpSitl5Bwu1YVPQOfmkK3BH/ug1skjv7
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68449da5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=K9QtY5NQ_aNozdUEqbgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BaXpyguWAvSsw2hqNvBrVlB5HxaBJNCh
X-Proofpoint-ORIG-GUID: BaXpyguWAvSsw2hqNvBrVlB5HxaBJNCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070147
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

On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 3572 * SZ_1K,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",

Any chance of getting these and ZAP into linux-firmware?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
