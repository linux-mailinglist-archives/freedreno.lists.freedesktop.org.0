Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4EB20561
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B1410E422;
	Mon, 11 Aug 2025 10:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA02Yh3N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0929210E42C
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAj5000649
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WlaZxjCGfsTi93SkuSR2T8Yq
 07Bi9pE1AjxRp5EAaPI=; b=IA02Yh3NboUJA0n3jJF6ku+QfGN0XT8g2rXZFYHy
 VCmVeGkQGdA0BITjpCxL1edsddPuQe5QTWsNLXvBQw7tad1h0hBtKRwE93PqghzA
 dhJUCdZsCZXqwj3zwbGr0g8/Ds1hKLCdjOBQNnflluOO1h+t34NmbXZzwwCXD43M
 ppy8wv9uyj/xeD8I+mcF4GXFvhh0zHrppeje6qljyf9RqJvDO/7dPwZ8/7NHxE05
 XzYTP7uYT5c00PkSBMt0AnQmxCVD6AHOAUDo+hRzv1lgQgsvArT4p6OmXhIEsaI/
 79LVIGNGDTTW64bNBp7uFHK8IBLz1Qw6dvDKJ3CXsKsEcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kycq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b08a2b3e83so128333491cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908345; x=1755513145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlaZxjCGfsTi93SkuSR2T8Yq07Bi9pE1AjxRp5EAaPI=;
 b=rKhhhbATnFD9WQ82EgAoLyHm2JdFVeXo9tpyH4343Lb2g2uQKcQzdLQhxg5sVdvpl4
 dmpT7SJssjlgpqCCcaqVgXzekxMYFR6nfdIPm5BGnhQJxyLZ2wVMOTtJxkOUhNSMIdNx
 o63We/zlcgjuqQkACsCtjEMLOo5A1Mh5I63OF3GMK2Xla8LDRO4pKqLPeYj1z3PNOWV7
 AGpR1FAa+quMxQNwYa4cRJi7StYoJ4h2W6G83hA3IUOJ0PZkSGcI3gmGUk1CAlTg5OkK
 98XhxiQ4gJjrwCvY5EAfZ8nENv31IlvpOOHjbClCYWWVJ8/g+ZinAV5h9WBCAj/2IBjG
 SNKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVai/tCpGMa2cNjI5OITc9tFPlLO2BJe1U7wiNSUi7i3hAZLunuGX+ugXOam/KHPo9sVBqfJabtjjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg8ZVMaWR0t0UMaV3B+I5Oe8Icnj9I+pq/TxKegRJ44pgZP5Mw
 3/L1xVFDTUuTbwjOx55gCwvRvigcoTvmjJHTkTCi5NebG0Kr0GSa+nHQmY7/7lEKDNXQDhiaXAA
 s6M3tyXWnSBTJAXf8IQAT9ZHACqZy+zK6NU/EtL64Uc1C3LpQbTXXcyCx9PHGoHvvfHtC4z8=
X-Gm-Gg: ASbGnctF61jbnQEjZPosSXBb/NkQmrbDi1SJWEi4NPrLGQ5N5FNwd3hXRsFy1hPhgSY
 4jnVizGg4U68fSdMi7YOH1ASnvViOJrRxFclTfNGpLopT3uNUl+lm2K5nKQCFME44H+dh3xXEnS
 b51GidTfbfcsApKfc5xgUb0Q5kM4iwoG1mv5SD1gse72kdjfkz1tkUn4F/oGSZRwibYv2G4B/SK
 nxvnUcUkXvOcmhry+K2FtNArQ7VlCQJsXnYUlpRUqorJ05jEXDUbsVn9p2JQFk/zY7nFPt11JuC
 3DJaXOPbZwfdLFImT9ccrqx1kewxyAdMcrRPkcThxo0hOnpo5HgMq0yXQhOznE3K00b9bkINLrp
 oYu06xFvlyJcdvI/ImS3bhavkMP1wwrov+CkkfncbP9uXMZxr/FG+
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b0aebe7865mr200416421cf.0.1754908345042; 
 Mon, 11 Aug 2025 03:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8sa5r1o7gt5+wFXRCE2Q7Do41HTXVXbxsWRBmDIwxhwtGo1QPiM9a8ztAkxfkOqvDVAq1A==
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b0aebe7865mr200415961cf.0.1754908344591; 
 Mon, 11 Aug 2025 03:32:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c158sm4264371e87.14.2025.08.11.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:32:23 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:32:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <oukh4eoh3kwyzqo5shujprxsizssbs2gckaa3fr54tqu5qmqkc@6nbvqf4rc5av>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
X-Proofpoint-GUID: BBUcqnJeeXC_fQGxI3qBs_LdRG_H_W7W
X-Proofpoint-ORIG-GUID: BBUcqnJeeXC_fQGxI3qBs_LdRG_H_W7W
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c6ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9wg58hZYqdY_vEwv324A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX8MoAr/b8NwOP
 UTB2odvwOKVK2Gz6Ng53ivtQNqAw3VD5DBV4CbV4WrbMPC/2k61d/JJVVPIB7advbzIu/6LNi2j
 VkYwisS7NOTnwWhk6KZeB8aNN29dytkp8+vVACDuxDqsYApkjWp0/EqsnPqRFEfX/85hKc4yf2V
 xfForcNcMs00x9f6Ab6iEj+6wO70bl3YTqR5LjUhQ5hAEkmwZ3WsquBLuG8o2J3NqdHHu2nm2Ob
 NCQzACzVmLz4X7c3B50bvtFb4vo7zYbbpEzQJOYdCz4XSyLKAMDS+UXnPtZ5UNlQ4FXP33fkyAZ
 rdzeqtv1OVbHRioUFNQ4Waoq9i/Owo7PehKX9xG+91JGG/gOGNxU7bYZNrAgKvIhGO64CfvYvT2
 3/ZiIVCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
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

On Mon, Aug 11, 2025 at 11:02:46AM +0200, Konrad Dybcio wrote:
> On 8/11/25 12:57 AM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> > patch posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Unfortunately pw-fdo doesn't track series replies. Could you please r-b
patches individually (sorry for the troubles).

-- 
With best wishes
Dmitry
