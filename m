Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D69AD2162
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 16:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56810E3F6;
	Mon,  9 Jun 2025 14:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vn7l4rV6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17110E404
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 14:50:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599VVJ3015275
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 14:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gXXryfwVQKKpIclvmqazUHr2
 /hWdodYHJK2Hup7V7Y8=; b=Vn7l4rV6d1tRwlfrGew+pDVa/lLUy8xn8yP98UxB
 N6/weTZN304kA9Cq60R5UER39thPS+g+IxkYFuZf/80Jg0cfnUF8KRroc1/s4pYq
 WdUIXvU4UdKSzOaRboNGkgTL3B3biFoOSXpq8PZrMhG6jypUOnSYVI+8bLLMMDX5
 7y5qII6TD+Lujd1hv2uINMblOqrUJmsTefvtcx4BJurdxalUeCZq6VqxmdlJM9qM
 o26szVsf5mqyg1U1uWjoNa93Up8onE5xYUWb2fdgkUMvSSOmzUfQdD5trTMFTgwZ
 LdnCkIolm+douUQRGga5ghqNMDPsyUhmM5VjBe7h7xvMXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11xjda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 14:50:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d608e703so878573685a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 07:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480652; x=1750085452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXXryfwVQKKpIclvmqazUHr2/hWdodYHJK2Hup7V7Y8=;
 b=hxD+PmlRif6aEKq7qaogRw+2+x/EZ5H6ppES3h4VQj7zF7LcAZ/FOlCGy8pj/8K18L
 iqpvszUEnT9GxC1Vq6kQtvjGbL5CLOa+extO3PRX7MAT2PGYOVoroPZUghNwXh/a4w2q
 J24ei38Yx1m+Q3d1oyJcn/lK4G1qZzo7n4YKCPu3SlFkrPB59h9vVeiOd5D2yHpbZkM3
 1k5gH6burDAk/RVPv8udaSN2kULecj8C4t0dRWIRC6gj7xj0MRIa92o9ELjRfm6kdgj5
 gQLVXGaoKxQ+qlg3ZH2AE6lB0o9KJzdOBXQALuBsBFbloyikusJUl2WoOd0pVz2X53nI
 ORTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwdX9aAJdJSrJkQPPE1e/XhIwn2hkOgdLU17854sLKy9Bn2UZ5wfC2Hfr5hiEjahv3syC8w9UvTqI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2MuL+W4Dh8wqhHO7u7AtCK35HXhI6SR25tMztaPjYuRqdFJI/
 dYgky+eudU1ngVXenz9a/P6B4Lt7CCOWtoao8MgihqwEZF5ynsKrCxrsYcKy3uM/p74uNwABwxH
 ZNU5OpGtJsxKZfx5855PkyFCJHJlbD+4CGQXbYMEqZqYpKKTXTIHLVhsltNulO8G70p9tOMI=
X-Gm-Gg: ASbGncs/b8kHIkEIkV6ZfWP8/e3FO/ta3/jt/23qVPbIDNg5rVNUANH8/wS0D79szyo
 J/Ur/792e9GJ1M8HW7v3JzsZBxs+nePCyQ9qZheVuDbEFo6qsU8XwVgQIUsFN+5mtvEyJxPPPd2
 d9qjII2BlYDw4/xZLrA0P3k4atVnpVDXCis9zekLEaw7+9Wbj5P2ZN4e80GtgPUnW61VnBoKGEz
 7LXp/7FqC7LuYOqHQzjPhVK2Vu0BZkQCwiNyfdpuUUjZmglLDbeYuSopbcVTJ3g5vF4c+/ARvf4
 IxIz+ob058trVKMBoUuDc0jap4FfWD9GJjTNKZN9yt7BCDY2we06o6sC2uMey0PiGla2hWPYOa4
 =
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id
 af79cd13be357-7d2298ec94amr2478840985a.36.1749480651696; 
 Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9KQZ5csfFeRf19Lg6Rga4uNIbAQ4j9v76mKsnJL2pr8UbN8vt6wkRD/Yt3tovojhBPPxXCA==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id
 af79cd13be357-7d2298ec94amr2478835785a.36.1749480651310; 
 Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7796sm1190964e87.81.2025.06.09.07.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:50:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:50:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: AbYvKNuR5Uu8_Kq-AOyHdalUGrCLs4r8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfX8NcieoZS+68v
 4UZf+3QPrVZa0JRchul3GslDql7SHn93bteU/CGrQw1OENYi2lyuBFotjetDAyOOPJ6hLZ+zymG
 hCRVT51Oan/0tM+cjHk13dNH7QtbLtxqah7gomMrclaFtjshaAAsSVEV9TTd5d4tV62KiIoN93m
 etsPm2bLSNQfeATTCZ5D6fAGxHF7s/aWBrJBsUcvBu2FGjo9I6NVL1DJYQp+w/4BvYAHrVC5dMc
 BxMAfmLnHwcHrBV1I4AdO0Q2sie5qR8FKd5Jr/upxxGeo2iPtzoQ4nUonyatWFC6fU3DRw4Qal1
 EW2cCToqrJ5G6qit4s/cdvp3cHTB6gXBA2h7Gur8z/YmkN+lhFAt6uOnPCVT8nZEkGf4N3eHsh0
 U6u5czH1hIhsTEA2EpSK6qHlDZqNCf8xKBZIXkW6ER44xUVS5kC2y1w+gtdITCZln05dzUMP
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846f4cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JLTXKlIeVVy5508LhJsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AbYvKNuR5Uu8_Kq-AOyHdalUGrCLs4r8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=810 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090109
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

On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.

Were non-blocking commits not supported before this patch?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
