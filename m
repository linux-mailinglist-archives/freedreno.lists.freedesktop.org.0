Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C349D0E08B
	for <lists+freedreno@lfdr.de>; Sun, 11 Jan 2026 03:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C951510E209;
	Sun, 11 Jan 2026 02:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jw3IG1tc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DafeS92m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F30E10E201
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60B1OHRj1384277
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=36jydPMHIlMPDfo/OD/hFrnZ
 gfzZvIz6poGqp6z9gA4=; b=jw3IG1tcLRfKg06DvfNUnLhqf8YGehdjp+D/RHG1
 8lCFrPN2AKQFg1EkGsEyx8s0lNvm4EJq5jRKI7ppnB81gb6WCnxvjVMmUeyMoiIo
 oav2Vo0yqEQfPiXqbAlkrgESaq3QNLmEwlezRgd3+AHWOyiUvOskCHAliTJXGlb1
 cVejzrilO8hU2NkuspxNVKVTKzfSffTclAxHjiqLBZHewJJlOqFHcAqzx/dgpFjQ
 7x9K2xOLrwt18uePcPAEmp2zWatf25t/kned01i4zKL6P8tl/rOOQHJB+QrTyIra
 gpoMLosK32dQvgezHlBEjU2noaOj0FdJ66/Ts66Fhmrj7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqsnuy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 02:16:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ba026720eeso1461133085a.1
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 18:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768097763; x=1768702563;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
 b=DafeS92mWru9ESF/jwO3M6eLb5UdCQrpSe6dsnIQtxJRdI91wcdg13fk24LYf8iMN0
 sjS3bfUHkpRRh05NTL0q1JRvJM63BGq5YG9qdT8Rm73ZUUX2A34tOE+RC1zFD07E/F2e
 Us1OJUBxeM/wKyMQhzB10w7tMHZOgCZ9ZE8P3iunjuSPzOuNFMWlta+xkiQbSSmFfhmD
 RoqYkjMRwWYMHLg9+3VB30SVtl94MGuzQHjqIEbtFjnCHPZo4MY2GcSSpmKP7N4rVE3a
 7rre1ZTLlhfzxQ8E4yxpFyhKEPyrK4pqQPJGuM3lLGhH3sWgETM5Huw7dwv3LTxfc3rJ
 yeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768097763; x=1768702563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
 b=Hza/QSVYrNot8LD5ihAVPWvZuYX3GH8lK+73M1YZ1KoaYmmy3/S6rEju4mQ2QhEZwG
 unj4CZV9W5//K/GzzOpdvI6rC3DXR9F7at+1Gefd5nn3qJk7QGoECfoO2Kvt8ZLAqGaI
 2QFb1KPfVRdHshxymLs9S4IoJDaK0Yx98l88mm1eEjbef+VpfQ37++xFsEu6xaxZTu4B
 3NfGhv56LN60wSWTlRgEoWOtnXSUBJdJbRvu7i9VtIKx3csnPO2VAqsXD/s36pX+4vM3
 L7ykfz8v4cL2vjFtBGDzBjf1HuLPDenTBI2q5wkMdblxtE5F83w7raaa4s2y3RJPsFOL
 EO5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW/E/6XZmU1R1hTlELOJL2AByJPvWZk3KqUWeDl8PtGaQ+WgTR3XAWbUTVkJ6iU8DiLNoq+3jOkLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybDAoCp1NCvJDn6LJbcLhD2XvtOAgafv6kAbrNnf4aK5oDbYnD
 zYhOyMQzkewlxWTW/9+tVp+JbUy1E0GH4KugKS9cI6Nn9wlfL2yxGOyfIVMJ8neR6NTKLAvJ1PW
 mK7ssFHZl64sxPv2YalqMFScydIqetE453Hi7gpck7M1dMTzIVjwtzseH6sqDQVIjXaVTJGs=
X-Gm-Gg: AY/fxX4vrlwp8a0kZ+RH5vrkOTqpPzZj3MLYs3PAQ93AcN1H6SDrh2Ypyo6djRrOwbS
 rr0TTvwKdE4mPuyjtDVB2a3aIrb45z3dHyQt02xhHHbLnxFDN6fkwzD8EKuxd10QCdgTgaV/4X+
 8KUweS/CHdFPZ+nQIu2cnjKV7LdIa000I0AG7/XyI9apLHTYklZM/GJ8/97MJ8ym8+404qcwdyZ
 4+3nw4cOteIgIgFg4BQt6oKoiRmwipVKlNyOJ+ueavKXG4pk64baCCoLY+eXHd/+lEOXa4eP+lj
 19M3FLGY0rLs6zvQyaNpqtLDPm23PhWLGTMyrD27W2JiH0ixCImqGC7wuhv7yRUH0b4fYya/3h9
 DyBaSeeKB6OG1NOS9hJi3WXhgFZA05CQMElpSsQatKRCMc4TxTUY7sVrTfHkq8i6sNUqE+32kUX
 6dKUXKe/Jmfo4Kmy46bDI/HtI=
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id
 af79cd13be357-8c38940babfmr2056522985a.62.1768097763258; 
 Sat, 10 Jan 2026 18:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjON8JUr9rP3ckXKrY4koDtuqcBKVzXl5l7P2QrwesMAKpa5V5NKX8AYDkATwzdlygkHvSYA==
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id
 af79cd13be357-8c38940babfmr2056519885a.62.1768097762773; 
 Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb3a0046sm30552681fa.8.2026.01.10.18.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Date: Sun, 11 Jan 2026 04:16:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
Message-ID: <r6yx23davlqzcgpjfneml4bur5qsb5qrjh2y6hjo52n34ykb37@ma32n25wxpnl>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: okN9UrkT_O74OwEFrfswWZYIDYm-P-F7
X-Proofpoint-GUID: okN9UrkT_O74OwEFrfswWZYIDYm-P-F7
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=696307e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GOW6-3cM_b2aOis-rAcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfXwZOtdpDXHdwj
 3Jmq8IxE/t3TXGoLswLGxNHlWLM4cYueQ+svjDAynT4pjRHjxbd4Khj2gowBg6PRpj5e3THyy/9
 COLzbzOR4t65u9M8QBkG/CFnMM9LHzGaXM+pw7BpWByRR09DH3IUE+DPoB/JvLFyGwVRZmX9K2N
 uXGEkqtA30zorqNseb8LQ0X6r9y4MG3ScVhMCmANI/GjvXf6hJhZWtU6BOuQcwjNIk5e5AKhOjm
 UujpFsSGFg8/0Ib2oMQxjLeQcRTmYw9xH8SX2k/cnQ/wR96EaYci4ehoxOEPWBmHFy6Vmb1uR9S
 KFOvy8PlP0p0208/5Z23lNA98mkTxMAH3qalt2SbM8GbD9oQb5kpvOHRjFiE2V7m9L3N5CgVL8s
 knC8xcAUGbrGo/zXkdguwyjyyb+WoN254dF0yNEAKJ6X0mUfFNp/Ck/gaORyuV9X2MiaJA2LuLM
 vPgJ8fAlGNIhNiToPFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110018
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

On Fri, Jan 09, 2026 at 07:37:28AM -0800, Rob Clark wrote:
> We actually need to set b26, just claiming to do so is not enough :-)
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
