Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA6ABAF16
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E7010E1EB;
	Sun, 18 May 2025 09:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0/g6Spg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CB10E1BA
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:48:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I0PmMp020337
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xeOReUMI3Hxt03467caU2I9E
 n3IbDwST/lECenXzhQA=; b=X0/g6SpgQqhIg+wgpQurGGuX+B1uwWoypnY27hcY
 Y1MbNVyNZBBE7z84kQO32/lwWMR3x8t3FI+JtqWuYGmg3u+MaygDIiQ8xYn4l3QO
 gktAdp8JExjheKeUn4VsqN8hgkWhkxtJA9tCdjbMqSve3P7X6pikMyunlEY9usqY
 /SDsoqvJetWtcD0R08dTgL3VDYkjwzoolLyl/mvyIFA2KPh9WzlgxMTKhkf1SViN
 61kV6R6KdylosE1wLWLLkHnTQb7niqeKxYFUXhR2Ixa0zilpjfGVvKOfu9k+OqQ1
 wnww4x+uGTcjAG2/mHRsaLqkj+6lsnDd1WREOaofdUknPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsssyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:48:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1092144785a.2
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561703; x=1748166503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeOReUMI3Hxt03467caU2I9En3IbDwST/lECenXzhQA=;
 b=t2G1ALyhQiY+wJSb5N7gZgw6Pc62MwPsApuzSMBEqxgeS0fJGkKmhAwRTA3AYwcsUi
 SvJPiJ86g0zbwM2oSou6nmUE0w9ftWjk4JpqrMuwFsCS3KtRx3ggcfvvt1enOBKrAz8X
 vaODDV7X5DEmq1LqYs1HNFrc27dlxnsxTPH4eK34QZn4D+WaG6SgbZ5oGMPeAIBxzEF8
 rhdyEW5c7zCmAuuDZqRt5nWZl7du8gN8fcIG44OpNCZrz88ewmJy+1J3hHu869mQr3kp
 UjGMQPBDMCtfv8YtOUZi3dcJsPjkaq7X91X96zvkTl4NxoS4tXEgiKl797TFlSfCad+a
 iAIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwRqAuQtjN+dOpugfudUSmjLCeb1UP3p1qWkAiI02nSBvQntFGm8Wc+PTCl78u88h3icjjMoyWlqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZX7kF6dl2r3kJtHRldeUvecGEvM3EKehiGqEUv/+U8yr+IclX
 yDv57oE6NRu5HbLkoysOTx5xXRLs/sSIEbJooKaOko8ozLkV4rB87GGXrYnW/nWUX1ECnQndKZl
 yylGkE+ESHy2OK7b7jb7ewAMg3uxvTZ3m0zFhhGZ1FkD7/bVdSBzczPkINWG4VXkJVd4VoDQ=
X-Gm-Gg: ASbGncvr3zysV6yFj+vGNi4HKnM+5Tw1A7Qx116Aq+iErIj7586j5aDIqP2OW8sk7v8
 P0X2dpdhaqLcXhkbxOtgRfpyKP8AuVUYZDlsCOchiK3rDYo3sAUeU9VgPFtrxQVyKfn5CqxykhG
 WoBVhrcRwk1JSSeZuc6rtYJILaAZ7daR2sakJ1z48kSJemSH4L1oY+2BYc44pbKJ5TXHBC1HYEY
 foWC9DLBhdjl+QdjuqMepJ+rvNK22DmKk/rA4yI8Ptyh2v7llXuI7nTce78XEdqSjf8ZX1WidtW
 Bi3r/MSHZiNhEGTeqAxEcbV+xBu1maU/tO0/lDTsfFPZl1rijHUKXUml58pXgK8oQuT4yrQguCM
 =
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id
 af79cd13be357-7cd47f1f04emr1103059185a.22.1747561703379; 
 Sun, 18 May 2025 02:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxYxoAbPZWvahXZRqd8LNtg4r08bn/rUDslpr+bykQGwOpoo53NY0+RqXYiJ6KdhKIbXOig==
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id
 af79cd13be357-7cd47f1f04emr1103057685a.22.1747561703046; 
 Sun, 18 May 2025 02:48:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017eb3sm1344694e87.119.2025.05.18.02.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:48:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <ubugepmnr66od42jux65ffegreksmfxmfzkjcjred32htkzoch@h2pfezdxan4c>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1QzQwr1XrX5eO5eQoK2bVRGpK_Y0ny1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX0qdKmfGEDufz
 SL81q3iS16yDukfevlL1fI8EjSDrb6C5nJKgvHi/16cC6SYkfg1I7UARIQPf8Un+RwByJOhGahZ
 6A5Ijb6X3jR1Rip+Wb5xhcRpzgnYF3pnbwq7IiRixHsRjMsIXWNCA/vv1CwXQKicZ2SUQk41ZZS
 OC+95suo01XbPk7Ceoj14Mqb+MU8HXxpsCYOepfH6s+buBYrekemEGLpFS/lurBOhNdnSaXJApJ
 HXKcRL+Ny1TtY7HY4jfhWCmzXAmHisIb7qynIrbjh66BppIJFvO67E9ME5vvANEAMJl7lqmJvdU
 qX2sm8XiohcZnwkc5s7hIL4OlWzs6lNlOFkXZ8mpTanJziyjnc6rhoBLe7IHYZ3YytzdpS0nCsv
 wBFJKpL79ao3TTK4SYei8LQOk/NnPXYc6LjBUAS+CXqnc1wmWevHrHYTioD1ESvKQyRzRs3Q
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829ace8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=OT4qMnZDQSWkCWZbIpoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1QzQwr1XrX5eO5eQoK2bVRGpK_Y0ny1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:42PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 154346591365f3f89d467674952abb2f067e7ce3..a20b57e964d31adb22f0b79a5178b45f0f5ec5d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -668,12 +668,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));

Nit: UBWC_SWIZZLE_ENABLE_LVL2 ?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
>  		uavflagprd_inv = 2;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
