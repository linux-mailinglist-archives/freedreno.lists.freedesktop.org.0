Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCBB0D88B
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 13:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6484510E669;
	Tue, 22 Jul 2025 11:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqYDjf2t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B312110E663
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M90BeX025565
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B5yI/2W/uYPNoZ/4GmFrmy4p
 o+IDogR9AhFLE+hirtk=; b=GqYDjf2t2uVqAHUeg3Vd+LkW1TXtE4eAV0g/7vUs
 6jHuV78xQ3CAewTGWj8qF74gcbU2tLapuvs3S1xhEeImjZySEk3Y2gK4z9rrXO0u
 mCcsGJ6zRqEk+KnldI4G5YOeYfwOySeckQ886d/PnjfQjenMoY4M2A8IbOZG7r5a
 Tm6MMDQqJlnNhNYX0r6GdNfUmymuA5eiVE5e/XP2ZYP2Ww6XH01/ujjG93SpMyNI
 y0FQhwkUbjYkZlurh8UQyjZqhpUhY+8vsut8KE9PDBbnAznLsSs/jx5/f7xUqX5F
 fF8ShTYqTp3rewB1P0XS2xOfk0JHgdSZlcrihCn0QKm8dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dh5e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 11:49:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e34399a08fso1246392285a.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 04:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753184949; x=1753789749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B5yI/2W/uYPNoZ/4GmFrmy4po+IDogR9AhFLE+hirtk=;
 b=N9Y/3sFf54M08JBbDR3IjITbJzf6QcliMofSeKVw1mKWTKm27QoE4mpsBYL7vNXsa1
 MgkYz7v3kBsxxK1OOoP/fbJqxKkgrmjB+ecVh92Rbh/f6rPkohsIaeLECtR/knckITnn
 y4sZJUvtlMYk05fmGa+z8H2WXkF+9Q/SCRtTCIENptKCW6Rqgp689T7ED+bxe3hLJFUB
 m/g6T+mRiqhOYtUcYhRIO6fK8sKtr0Vp+M+69yX0EwRa5mli4auObc7sd71DCMVSckpq
 P2TbS5jEC4J30jJcleXIslyajo3EB91/fRbsEADB53078dTn5Jzlivdn+z0u1ZHCWbyf
 Ja8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnuzh10MuIGsC/tB/FItiwO/66gaYGRPIfQC+Q88IAok4ezyuWCmUOznttrd9vEmhAwavtY8xwE7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1o+cu/MvsNzGJUBhpZIOIld1qEyEd4tr8lBTu+S1d2Vqc9ZLB
 NnW35FJGETPCWnVfqGTHDGhh857pyLVdTXT+j3ckT2XWRN6O1wrUG8yKICED0UDaPYfXRkoJuFM
 yuEOqjvHbG9wZYHH2A5nMeDs14F7H7H75aT29d6eMPFybSWvRBQt5iY01IFp4U7fMpFUe8DE=
X-Gm-Gg: ASbGncsa5ggmRq6OUs6BD08zO+Md0GpAkLOgwM6viwikEt5asesEMwoXiE2SzjD1gQv
 cbncd8NBKJvA/pPa7QNC6zfPlI3BpMvPfea8M3NUDtiMOr6E7Xeho8xW6znDOLlir+9zD0A2t8i
 ef6u9sxHHLZiqZ4lit5/NLzdFJjwkjlHZ4QXMKGmS21v0o0fq6kXibcqjBVKMYjiwV/I192+XGI
 b1D+nTxPWA8N65SrA2c2MWw6Li/K+T4aBj4FLAdSMOXAF7hXem4o8v9o6kTZ1mYAGmxp2ZnZnbu
 Qu9gP2TYnN+dgIhf2RA9GhbyqQwKCNjZCVZExpEl79NjlVkFXuCEqIOezx/CyIjSWQVdYr19GlB
 xPs1ZpGi7ViGojKrYEpzKChwBMog+nV32YMSM1HC3ZrLZY3IyF2P9
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id
 af79cd13be357-7e3435e9e32mr3649940985a.36.1753184948573; 
 Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEePpw0gnZfgOgD+EN9ULc+lx2jNFrznEEMSRNdte1hYVihbfjQ0YCdAjzvf6azH9JLj3QIsA==
X-Received: by 2002:a05:620a:318b:b0:7e2:733:542 with SMTP id
 af79cd13be357-7e3435e9e32mr3649936285a.36.1753184948067; 
 Tue, 22 Jul 2025 04:49:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9cb18sm1909407e87.20.2025.07.22.04.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 04:49:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:49:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
Message-ID: <uh2lkqa26lavl4evsckiontkmjaiiwvz6jj7zjwylrfojtd5ne@ibk4ckgrsygn>
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f7ab5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bYW4DojQpC9BwyScwp0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WXPqqCQNSccbAAjsz9F2JRglD386E-lT
X-Proofpoint-ORIG-GUID: WXPqqCQNSccbAAjsz9F2JRglD386E-lT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NiBTYWx0ZWRfX4Tg/EIoElV0k
 yMEwOwRX/QNy1LbAzNAxNIlcsfcO91OBVsZRvDeQ2YjvRMVJz4ZBzw5wF1OKGvk5EZMBqkSBRhe
 Ju0tDl2vpsfOOKi45qwJMcfc+SXWWjh1mPqplNcIgXywQkFjmKhIgHU7VXC9ZQ4FPR1E8etxt1B
 YjYSPtn+rUS5TpX87K0n/jUqINyvjG9GhMCiYaauPkxRDG2RWtxcA6rxAPPA7fTeEJvAgKQnJKc
 MOIRDMM0AoOVrLFH0pngr2F1ZfCwxIswGlTTwHOE+7CJXgezWSbo0E8FHBU94mP0CElP5OoMh1Q
 Zf82nz0OAV3v+S+Wx8AD1V8X40jWjwiqgQdvv5Es3f5hspdIDxkyYQL7kNVB2K9bWxzipkxOnNJ
 u1ysDk6bOrQpxFZlfM7ZUi44RxlPH98pJKM7n1TiifzmGIGhJkkpD44m6c5hXVnt0XAH+WMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220096
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

On Mon, Jul 21, 2025 at 02:35:04PM +0200, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
