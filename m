Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E6B328DC
	for <lists+freedreno@lfdr.de>; Sat, 23 Aug 2025 15:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB8A10E009;
	Sat, 23 Aug 2025 13:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="esScmJq1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F3210E009
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N4mAoE002635
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NJutXUx9GwbOyDCxu0OWA/tm
 x5myteKgI5lzXDqLEUY=; b=esScmJq1afz0shmLdLYmLpDD6Z+89szHUSJ/5+GU
 Zk/vYSEmBVI/mAP/nvVNpIwlBxKYedTO+PWzTV3KdgxOl8g1sEK7kIw1cd8LUkiZ
 koZWRgMkauLbpP6Z7kbxAkP47GEp5gM5G2tKiUCx2ib6ZUpgFp/Dza0H873ag7Xv
 ayc6cfuWZmH1Epkn23t0A55+PoWPQIp3d7QpdsffJ2hEZc1t0UGELxhcY/UOkGVa
 rV34lHMEtr0/Pa5lHtrYl0V+awcr5hUIk9LvxRzG1pMASjQhDddhLDGopFKf9f89
 n96SmbHJsuX3KaW/ImIxm1B/IpzFkmR17lMLNvEAsd0jfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x80u1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 13:49:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109a92dddso88016141cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 23 Aug 2025 06:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755956986; x=1756561786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJutXUx9GwbOyDCxu0OWA/tmx5myteKgI5lzXDqLEUY=;
 b=thmmTUtKgQtdbyr5B4ohgeqVlvQ02+Wc0eOK2gIeHxKUuJSGJcUAsyFY92EW1LKF4L
 +xLRsUTrRV+1JWnfOWUzLdEB7uRH5J3YqrhnB+eTTLDgYynsEXVrc4oF0r7FYp0kQ/VJ
 s4Zed0fNeUMjzRtcaC7OPf3zATqjMH26iCpMFtqKvhOY+X6Q764O0WD1Xt7Lj5Cuaj+o
 XvYnKWFF/Y2WH+SPu8/f0VgWn4E8GUCiNJQuO72K70tA4B+dIdQzRVXEhu+eDNQoFiLL
 IkLEXoFkx5J+xn0a439Ld/QvwaAaUI2NSICnVAsbeixRZu+TWTNW9vSfNS62+ITE8oJ1
 09Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4gGLwpF8gSNrIUgGMmdY43pHwiY1tz5nWDpHgRZ8QBDdxxpCEhlmafdl5RF6M/jc+1F2PLY6ZXfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLVHP7G3xzu9QiK4+EVx6HgW41CQfpm2NAHWMDgrCXpZT+QtyS
 GHyhZ4Tqv6iwV0RXNQaQIshSuNy9Ijd0zO5Yxxy5JU5UGrGm5BG6bgdg9pgOKTFbdNPmpAC8C8/
 DZ2k6kEhww8gD4h9VmzQSpS61Hm94EWTvld+1uWn7ZELPwdTHep+qGC9ubAzmHIjhI5w0PwY=
X-Gm-Gg: ASbGncuQQP1/5ZuEStWPA+vCF4NWG5kZf+icZrqvXU5SGx7NCmumumJRSdToKifhf6k
 HZlqbOyfgbVGKGtx2YQcpYRFkF6mjM6f/C+lhum04jMSDKhjZbK5I4TCvXri76H1IbIBJniilmX
 /TxSlg3AJzToWNXoWJoL4EL7Ba3E1mEco0p7Dbw2JRtgSx2dCSZMUVDrUaBEnm9Ne6Ieko3YR4m
 nMsckLBatPQ5JfGBNOctZlNLRzvfeNUnolInYi4SWIrGj9rmgYKcdJurs31wPjSBydiokDwiG3S
 hcEMVya/JqbGLB8GbuCs1ZHbQZKnfPOP3SWFMFt/pIIBnYph9NitEcMQ3Lz90HReISutJeix0jz
 KFR4faGr4j7NJ7JWyF15nq5jBvkqO8UXsx1SXeoRp5BaYWmgt1QbE
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b2aab242c5mr75185331cf.63.1755956985923; 
 Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2g0EFzejzCmD7mV9QSqwLqUbabc5ibMXHvpMqoKZRAVTOkV1CMYQolhIhiB2z113FQRZ/OA==
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id
 d75a77b69052e-4b2aab242c5mr75184991cf.63.1755956985376; 
 Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c01e5asm529627e87.26.2025.08.23.06.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 06:49:44 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Robinson <alex@ironrobin.net>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
References: <20250823020919.9947-1-alex@ironrobin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823020919.9947-1-alex@ironrobin.net>
X-Proofpoint-ORIG-GUID: dIgLjpQ5cE1l7aP9L1yQUWce7kMDNEmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX07DkT9hjwK3e
 RYMJzvHrMGY0s3GF4NPZScMfpQW3KVUbPYyY+TibgjTtb4QbnYrJWoXcojnaZjO/JWhCLKyLx6v
 xvGzj1qEwRUTw3G1ij26ygY6wBJZXqOiA5tNnM8+0YCm7cLlvLD1KSvhDZvKw18I6nLjiNJ2MOr
 rzNMueMS7WvN9mOHIBuqXUVbCjeyv2/st73+h+dmtW2jzKhtwMV8MYa24qx7lXDyUVxX5AG36Vb
 DSyPTgX4UnV7kZjq0H9ELupRpcsT0bm4XsfwMCWoZHRMhrm7YTF5441z9zV6oo1qSuCeROuiwqI
 LLct2r5fgoMzrSPWZRGFyCZjs/y89NUITW1x1VtItBKuILRnSh8Wn3YKFQxCu2njXd9dalHKVHt
 ozZlihdy
X-Proofpoint-GUID: dIgLjpQ5cE1l7aP9L1yQUWce7kMDNEmW
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68a9c6fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=foaXouvCAAAA:8 a=lkkxZxBEGYBqsCjUt94A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> before adreno_common.xml.h is generated in trees that generate Adreno
> headers at build time. Make msm-y depend on the generated headers,
> removing the race.
> 
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> ---
>  drivers/gpu/drm/msm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b..1a918d44ac48 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
>  	generated/sfpb.xml.h
>  
>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))

I'd say, no. The idea was that msm-y should not depend on
ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.

>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>  
>  targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry
