Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E5A98AF8
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 15:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AED10E6A3;
	Wed, 23 Apr 2025 13:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8A/Sy+J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7348D10E1BE
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbftA003028
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PB3zeJwysZUF/ByBSq+dhGKR
 vdPDfw2nxYgcYIOLE7k=; b=o8A/Sy+JMV06jqoMqAEv5+g+6FDVaLsmlIWxloNE
 eyZ/EllNAnyYMZUJHD7/qcGvvCxNbY1ME4C9kk6kfMRheml5qkIeDP3rVubG4PAA
 UziHFc8yy16AMPfamL5IOvke+Fk+GhleIfMLJBVwlcwZHzXdSsfhfoWXPaFy5HEQ
 pyuys0GQ73qgTa1J3xXaPu9/TPENp+Mfpy7RQyZJOYaSj3pqzGmqJzXeGFGuMxHA
 dsyUxzDaHCrDmKuKy5i8O2VeZX/H/BE7JXFfoFEarVwBhw7chpY7vglyw+ByK0OZ
 Jz7r2tgbdUcT7JMPxrJqh/7p8DaKWSpx7E0BjYzm3AdHLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy2879-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso185438685a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 06:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414924; x=1746019724;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB3zeJwysZUF/ByBSq+dhGKRvdPDfw2nxYgcYIOLE7k=;
 b=M2UNgfnI78Up7rTbpvaalj27bGxw1ZLDxU9QMAgVoIAToSnnEM+IP9LJweiK3WsYN4
 mEafloWBimgDa9kDWn37Pz5CwWvSgC+RpmNwAf167KfM5PZ0txS2s+g7UksC34+c6B7R
 qAscXr+46ljO4A9xCCsQbvsV1OGBcjwAH1OfCd+nZbBeSASIIJULy2yxUeY9HUZC/neD
 u1cfNGrrYDLJMvmQFNA4qgjprzhxeBWCpkJN5E3UMvF3JS6U/ii9iJTHlTQ51Qz67KCo
 BRcqfvjLCXiq7QfBE0utx/VoJ3L0F5J8ab4jHmQXiSxdPM99qmJfuT7MWN4DTVujF+n4
 tW1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqVGFUABXPI8x3UbD5r0vdPf7WLKqXC6uxi5r2b2Ky2rZoVZOntLHg0dTBfZX/kzjGFN6Rmo83mH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGVAyoKtqtFOUMcnE2NR1A4MHnAoMYBpJJ+ySRMrx39c1kIkgV
 /v6COkcqlqpcZZMqRoNa9vq+ngq5tS1Qukp7DJc/TccE1KTmHrys8cN26N93ASfy16Owk56ko5Y
 XqJtOj7Pb+CrL1rw5ap1qlpFZzYhGljtHNzk/Q1tz6vTn90K4AwyyzKdqOKdmEibyJzk=
X-Gm-Gg: ASbGncu0lIje65U0ZGXpuTBpm4WbkCbHRR4OhEHzVrW5PJ6/lsVAljg2T31Kmjj4MJl
 ZOCvYtxNd9A/3vXL56IbiP2Kvc+FpzPc0D3m5exRoFm/r3fCzDfOm4hofm1TRgIW2ar/vC1Yzm5
 XGhVsoyqeyd+S36zRK23vAeGzctx7IkE3RxOXGya0muzlV2YQv+qS+/NdBvOdMijjl/FIYZrIt8
 w3VpOkQ/2ip5+PXKDC/elnK0O1qUGA0Z4pDKfa9OEWFSirYnOcvW63DKc1BQF3CdoHHhlkQYzXg
 9bNVX4iAgC0rbQVzm/Zm7ysdZVKTEaEano8dBaSWN7yI/4srnZWM2ZwmriD1tmRJq2Z0TfQwRxY
 =
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c94d80df6bmr443622785a.5.1745414924623; 
 Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk636fFRRkvuLyPaBe/JMMbB0DmZRi+A72gsKa2vsyQGLytxQjLxNTJxnnRLMfxvaeNdGcxQ==
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c94d80df6bmr443619285a.5.1745414924226; 
 Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5423a2sm1534611e87.101.2025.04.23.06.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:28:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:28:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/7] drm/msm: a6x: Rework qmp_get() error handling
Message-ID: <skrb5hkl66gt6vr6c42tx2ipfn62uuouztd2g37xlhreeq7nqj@r6ohzexpwmy7>
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NCBTYWx0ZWRfX4jQrqJ9kJ0xD
 k3VMR2PPtPWTb6q3FAQ5z90sma7Qji9PUuiTPlc111IWBOxs01Ysp4FZCabgYWi+UiY3PjeOpq4
 IqPR/Lx7tFF4G5gqpFwfaCBVnommxNg/hho477dojbUl08Za06V2BDY7l4fTAVY00D5SbFCqkVu
 Iwf9Jm1VUjjjvOJs43SEN+vMG0nfol62f5zApW9on4aQOzF05U9yNcLOK0kjeX5egv9CPKPdYMP
 TN+ZdGGyxMJ9Wd7d0FHOticNbQrqnVosRwEVjW6MvsHrBTUZyZPAwNIgKtddAT14DBnd3WSau03
 1ECCiE0WT5256HjMMDbyd7elmCMzQZKF1YYSiQBS0gCHEe/r5pktTU15MMpehtdNXIHnCVOAztn
 DquoX7GNCeLg3v99bBrBA6y/bzj9VJSQFRUKE5CnrMfdW6SQeESDEXvSWGkX4szPlvHBksD4
X-Proofpoint-GUID: wFyZYp9eCJ2JE9XNFeszo07GL3vxOOp2
X-Proofpoint-ORIG-GUID: wFyZYp9eCJ2JE9XNFeszo07GL3vxOOp2
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808eb0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=3mVCJS2yw26y67mb1AsA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230094
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

On Sat, Apr 19, 2025 at 08:21:32PM +0530, Akhil P Oommen wrote:
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

If this a fix for the existing commit, it should come first and have a
proper Fixes: tag. If not, please squash it into the first patch.

> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 6bd6d7c67f98b38cb1d23f926b5e6ccbd7f2ec53..48b4ca8894ba38176481b62b7fd1406472369df1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2043,9 +2043,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto detach_cxpd;
>  	}
>  
> +	/* Other errors are handled during GPU ACD probe */
>  	gmu->qmp = qmp_get(gmu->dev);
> -	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
> -		ret = PTR_ERR(gmu->qmp);
> +	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
> +		ret = -EPROBE_DEFER;
>  		goto detach_gxpd;
>  	}
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
