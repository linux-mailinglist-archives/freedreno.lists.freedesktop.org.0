Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E85B50088
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F8710E762;
	Tue,  9 Sep 2025 15:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXWfFaKk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087B610E762
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LZ1R029320
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PGW3tJNZDteIP3YWspfNxoS6
 +2pzYXFb7hKBbebA/DM=; b=YXWfFaKkMC1+j5b1iYb6QUPrqIk7nP6cr8L/UC16
 Cl+bpVKeRzCRGQtXdtvTpP7BVGjRCz4rswD1ScxBqUGkOAevNK3ZsQSkYVEw3296
 odiZJzF1WEuWmus0e7fSEpl2iorE6UbrjKU+fl4Xr4uZcEvNGV65h9xmjchkFE66
 O1o5K/6IDPWh3b19rVk9FPUdmuUOTPFV//LLoI7T7V8quO8SM62kmEbrV25Xjzy1
 LXLq9BUMEsbVwm1avYXcKbWNlNh/gVKGmzhzq/XP2pkDIJQpOFTihbt74QfLXKt8
 7lz7FyxIiL8uhg1gdyCk+eUDBIIMGYpvYJ+VpACymMbxZw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8gmef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-544b20274deso2512219e0c.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430094; x=1758034894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGW3tJNZDteIP3YWspfNxoS6+2pzYXFb7hKBbebA/DM=;
 b=ndglwRtGmExvYmu1ED5uwpKfqfHb4qobeF17LE8qteXP6jnpzMWIw0ldMzk0gWNs18
 2hOp+Ze5xrSiC310ttHn3YkQj5KLcYKP7qxdpDw5QqjdCKv5J4RiOP8TJZ5/rruvxwX8
 09o7Xx5XeHSGVfiUEAU9BXhkdkIKGQ75TRZ0ZY2Jvi9dDjVQ/GVNBngnGuGhi05uRUfl
 fE5NlYWLsUZ4mz3O1Td5hMnaG4YyNXmajby6CzM3cVT8/m6jJLYbZ8Ffb6GJ+Xuipuxl
 5Hxl6TQ8PRmWCWrCWXLM5tEJpXxSofnAIIKrmidg5oNRTAGujAiOUkp3G8dOiLuoPJ0l
 POHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdLq1dNTLyYoEJMhF95qRCPueh75b4lR1ZWiDU7jJS3S5dS7Y+6MOZfVdumX1FE2fSgZGmLsGKoX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycKwiE9BtLF0zMem3Zj1ZRan8Vbn2AA7dU3m6dcjfEUXwDdkox
 uTigCTtirOTjdwfCnJcHGQxHI3NX86CNYI3KzR2f1zGroSAyBXFyqCWxWyq+KXc8XWju0yHvZfm
 q6yiGeMoozwtLGS9Up+ibqRGJa07p5kpx4FORUhUwzhl9+vPAlxQkm7pRLm/MmyH0bhaC4Dw=
X-Gm-Gg: ASbGncs/+qtiIHAbk43nWa0Q7iN72/IdMhz8vps+SyW3Eaz8pBnfUoApR6CRJKar/Vy
 6KZaPqgC6aoIqv8CtNBT1EXpOmoPcQT5B6obei1K5Xu2NHDL75mZl/VchIgs0j4M+5OUBgpypbk
 2DTqdTVmJJwQsZDjv2fXYlg3yCnwNNpDk4xmNlMkULUg0qtFz1jTGz2Yp2e4N3Gt0bz/zv0a2hY
 LdHcB4w5I+SF/x1bWYopE2qxh5cD/EbCBI5XT38QP65PTZTrQYogtUJTsG/sVdeLu0pPu/67gtX
 Age/7ilscl1OWBDxnVIPG1k+GAtcoVf8e2AsVKsmqSGoZP4pPamZVy1/3VPXwqYExcfnPNRaq2P
 U+D95ub1xbNuiveqAoVkle2EA36UYCbe7827rM5DejVN+pAqJQ2ql
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-5472aaeafbdmr3072902e0c.5.1757430092409; 
 Tue, 09 Sep 2025 08:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tVoSxr+v5y2YajVPq9Q5lmHZV/iznnupYsR5oyRCsxpu2WpDH/jpQIioCiy1sxWM2IufDg==
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-5472aaeafbdmr3072611e0c.5.1757430090771; 
 Tue, 09 Sep 2025 08:01:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032be5sm39213621fa.34.2025.09.09.08.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:28 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Message-ID: <pzj3qurdrz5k6h3nylqeiplfj5rnbayp7itzonxnekdrtzkii7@gh542xo2qm3b>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/wvB274jUJNy
 twPk1OpB5UdgmdQgXbLS0T1kuAvtuM2skjqdFS6hUIJo5pF61yVot+pylDON2jUe/5GIHouFEs6
 oSGp0q+1oFE783Doa0c0BUha8Ca99g7Qs3y6d2a1+rSvAhDlxQgQJHlqEA2FvYcjEGgq6eDXWKn
 H4PvExV3huKZnnBgmcLi50IA5kvctNzaW0sxClIYLJ7pIZQfE04kxxkJWuKWWiLn3HQfVTirTBq
 KY5UIrTIkGYd4Dv1JcdkoaJAshN741d7uKx+t9xR4maUflauZ5cU8lxWFT37YoEz6BYnXs5e1H3
 X/mi8QCT17hhGXTbSPojEnHYEcNFZ61sWcZ0P0aBLaO1E6K8YAefxjsKONREQrm+4/VGyfAA/1D
 fTkubaa2
X-Proofpoint-ORIG-GUID: EfZif0w6bfafcHqIhYlwLhzkGjFmHWXA
X-Proofpoint-GUID: EfZif0w6bfafcHqIhYlwLhzkGjFmHWXA
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c0414f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Mon, Sep 08, 2025 at 12:30:07PM -0700, Rob Clark wrote:
> The upstream mesa copy of the GPU regs has shifted more things to reg64
> instead of seperate 32b HI/LO reg32's.  This works better with the "new-
> style" c++ builders that mesa has been migrating to for a6xx+ (to better
> handle register shuffling between gens), but it leaves the C builders
> with missing _HI/LO builders.
> 
> So handle the special case of reg64, automatically generating the
> missing _HI/LO builders.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
