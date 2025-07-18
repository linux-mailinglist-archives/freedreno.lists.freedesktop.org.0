Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51BB0A97C
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE3510EA29;
	Fri, 18 Jul 2025 17:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOjihzHU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CCB10EA28
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHFfTh007301
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=f6yNaiRLHAcK+6GC8eMfTdPL
 ypI+sKJ1RhRN3e/m+tM=; b=TOjihzHUobpA6dFi1+++Hpb9xgD+bHm3xJHRqLqd
 CV4XWt9vKzLLg51HQ9F+OCmYbxK2s8LfdHOPNyCjtr+1qujPhZivZxfVHGnTjjIl
 OCg6TVvyjhWZvUYXTpjTQy6AnCUtShf8RUcL/+rOxqYWsRRNj6AsyyczA/dT5D2d
 SNEl+EFiynDyIT/mDLsDmGQOhE8CAwmg1hhv5IfU7xzibtcW3chHD4isF52Gqomd
 APa0HuB0GLjFDnwYzvB3859uVjnGpRro63e7kUcI29A+bs7Se991AjQiw6jGc4Uj
 g9fIwhGe8Tt5vJIWUu7P5yCA3kmo+l21eoeKHIlQcDJaDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcadk31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so424040785a.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 10:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859720; x=1753464520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6yNaiRLHAcK+6GC8eMfTdPLypI+sKJ1RhRN3e/m+tM=;
 b=lLweJ3TOmE2OfDregxJ373JtgS0DAxJYugzjBtMU39f4KIny1sfNqVPKRLAj1jtFiC
 2H7mPe+mA5Zc5OndKHV9GUxdXMkZVIUPXywVse3nC3Hzlhzk/ix1XCQc3sweszvpqObr
 A+l8Bbijt+xDyydoCM1BMJH6puh1dk+4d0qHXNSGF1tmgzw20hoqskG1+bal+/kMfOIc
 hpwe2N2wUxPBOpIDoSyquEEXVorLVTzGc8uSmuBrLE5TLoCgfGwLrcu3BI58A7BR0WVl
 j8ssH/gEqf3XwulosFYrPNtOCTFZyIPZD+u/cjuZyyGcGsp4Dy615RVlYxMU06/Jy7sT
 Wd1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuMlLeQjo7LDtF6trt4wruLZ/8GsnMZ4R899hZS+OtLi1J2T0IffvcroFWjefqG3tbCRoONGyfKfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD1zBZ7h/glAhVemAMJ/04ebCkjyfFh7cCYakoEFvCz0yV+nY8
 enlNUhOIAE6WVTgPdhiYyQ+BbdMAuYycrmCEliTmga+ejFmx0TLAWW7VxMKQddQT3C/iFUSiCAq
 xKH/YSFbmJr17oL2x/uvVyGqeKFVCeICSrSPkCxKILDtEtxqAnPbzUHnlN5T000YawXNHhlY=
X-Gm-Gg: ASbGnctOEGrSJogwc+/5SYqf2FD9fstgt9najnHefE0qTUOwWdrv7x4fxbvLbk3yl3p
 teBYxAuzmw9B/+YxuS27jxKd+7aa7N5tnFGYtfHsXlhBy9ABdr60g+hYjvSbMRudl89S7bP+xsp
 8TgSzpwxoOEvqQwHb1EBSy7yWqTE2oMq+BhPFgarn+kq5liaz0d6+m+vdGfX9z1m1mCwJBe5pGD
 gzLHeeVNJUS1ZUdU+i8wHYug4QBz+0ANErPcgwjJB7BSandyE/b9HWVeulBAK7kIQhguy4eQTM4
 Go1S+l/VMWoE1jb9bO7EeWUJ2iQtLM9gNVGv3VwUGrGhcN+W4Vkyyjcw7S3k2Zm34+pUIKXJjJB
 FvmISVak4jV5HZxMK4NQxXwJHX4Mln9MpIBZijH5Va697PV7I5x7+
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id
 af79cd13be357-7e3436253d2mr1626776585a.46.1752859719408; 
 Fri, 18 Jul 2025 10:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1w3sp9zVGjYWBmgKH917pY8I7F8sCh3F9gp3Q6iMWVLnWjt4QkDQ8fFwWBHnJpBaRVJQW4A==
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id
 af79cd13be357-7e3436253d2mr1626770785a.46.1752859718706; 
 Fri, 18 Jul 2025 10:28:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31aac76bsm336325e87.68.2025.07.18.10.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:28:37 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm: remove extraneous semicolon after a
 statement
Message-ID: <qjvxpdibdt76vvw2capf6mupiuqvjlcevtfl66dkqp634ot2zd@eau52bnkh5ec>
References: <20250718133404.2047673-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX/t8hiqDZZtxw
 UgPXx99OFDOHR4QxKpPJbjK5oQULk4VNpj2OHILCMS4oifzT3xBhGuXQ0rCPwb9feM1hlKIQ56T
 tzN9LdKrw/KUzpHDwydaMa2n6fn8cTBOBRe1CxUqRYR2y9y+kN6Ciqgtg/zinWNvDvgw92rSRST
 rSlhhCHm056VV1h5yfOgOeXcazT/9Hj0gVWn5F32NA62cCxgNrNTg6tDosNfwLZwk7jsT+Zv7QB
 zbYZL1OKa/vrp4xdjwEGYJfS7StU9SqQU2IzvBwDe7awXWnNXnHqLi0+uz7SQN8TKW7PYWPom04
 Pa/mn0CoBb4g5X21co0U4X/DPFZcf1Ii8CvorLGW70bKrkY5c1bIiG/YXPywHalB9kpSRgLUgZ9
 S4xefg1MK0KswCUAruwVAW9LcP9GKS/+RfVwn9UfEhKGFkO5FQHiULjbw9DKSvtcdtV1LDV4
X-Proofpoint-GUID: Z8GtfjgElgy_1kqL5qa9atO1GvXmkv20
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a8448 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xHVDqe4EictJAN7MuBgA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Z8GtfjgElgy_1kqL5qa9atO1GvXmkv20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=751 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138
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

On Fri, Jul 18, 2025 at 02:34:04PM +0100, Colin Ian King wrote:
> There is a statement that has an extraneous semicolon; remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
