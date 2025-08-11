Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C64B205A2
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400910E41A;
	Mon, 11 Aug 2025 10:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCgSXoXw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E0E10E41A
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dKM6018331
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=THBO3Ht6NQgUDeA8sx/NDTH/
 SHFPOK+ez6KiHqIf758=; b=ZCgSXoXwxACGoxz5slStTGYzUoW024sR1/qxOGY3
 bwvghtj9Wa2fgvS/D5rLFQPz1rDU50j8kAuNQLZ6boWvIo0BEtaVGOImPiwL1DDx
 2U/SJRru2AmJPjpkEauj1opJ/mrJcyx77UwAkC9kcNrcqD05vMIB8CMPV9sHEqrn
 jfGb0HUsk812wD6iHfJ35jmQnHNraks+f+hRrYHbPb1eKYq/e7bwJxOZHF4sTZlI
 JuWyw8nQ+7NnGdsElSd547SBqwC1Q7AWZ3eG9mhMTiQOtE9tpY1KLLoxuVTI5Ca3
 zjzWZHG2WymBkExvB+yQYK+XVwBwMhOBL1BASqKNiikeCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g40gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af1a20cbcfso111360411cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908566; x=1755513366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THBO3Ht6NQgUDeA8sx/NDTH/SHFPOK+ez6KiHqIf758=;
 b=WywqsQ/L3+MdxZOt2yGUfao/1D4xQLa0jkCC86/JOPldy1qkIGyv9TMR0+dDmpi4cf
 EOC3klTUAr4Aje0boHlFprl8e974k+QVCCqClQzmepQm+7/hHFxnGE1dOYIEHCxwAVP5
 eivQbYEA+i98Bxdo5Wp/oFlw2hByreX0rcXaoi31PQmanUApFX+IJFYjioplBUFw7KqO
 nBh4j2CF+DNweT3pHkPzFQBXIxJP03/9OSa5fav0ABKeUPQ24bK4T9plDT7Y9+N7BjGu
 YCqgDUJz3jia6Yb0T2jcED5gI/Vavp2I3DwkM7KuUbSvaFvUzLmV+Dp04JMnHfo0dqN1
 tcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWATKvpwAMa45FgI24D6PUrSu0vIY2mCmkF8VnQ+0TkvDx4ktrHMEG59Z9VKFTIqARVHQBgRwjPBE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ4MBxj+xl5a25hxShSZOozLD1GlWSaZX5Z+c1YUyn3EEDZCye
 JZ0YybRTn1n0AjMsP2xxYFW77spSqCFbHhsVJKrA5hnS2lRwJgCeas+QIVVrjkJk59vXQ438H1V
 ZtNJlh9I/nlckqvTWe+52X6PwLiw2NtoQnl5W6jX96cj0IdrV4zJzQiBSUNp6gsWBM392yek=
X-Gm-Gg: ASbGnctsMdlukljYeqqvtuJdtF131jIyzj+UGMiUowRPPHJg685C3jlqDpeQg6NhMUE
 5veovdnRnRsp11oJpr1dZd1mg5QHiUD5JqPxRh3k7hyp8PbpzXckfzwhRUCRbF18ysl7IsPQ8+g
 QTHTcC4jbRqa1CqouW8Q4IWpW6NwmUoBGMapLy9NEqsxx9eqndgDU8eKOuVH595UDasdLAuDNOn
 Yu50lTXu0XnlHwJxCppkHlZIj2T28kRr6ECRR1RJW8+4eQSzu/P2JYar3UdwVu3OLFz4GPpgYbf
 5WulFWvrwsNYKlch9rgy9Q0FHhVNFwSjB0rud5otBP3bDcwASNMvf1JDr83eTmi9nU3hnM0n3F2
 h5T/WT5vTj0ZXSpZCst/QPUNxops4eeE36fScVQpcauRlcG5G+xXi
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id
 d75a77b69052e-4b0aed448b3mr160849591cf.24.1754908565701; 
 Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw7HtgnbrmY5IK3DxlGzc/b7uNHN6VMIXvm5Uhzn47fOPoo6rohuiiCW0D4J13E9SUX5IOMw==
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id
 d75a77b69052e-4b0aed448b3mr160849231cf.24.1754908565258; 
 Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca6274sm4249936e87.140.2025.08.11.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:36:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
Message-ID: <ycnscnqj5nkoaqlvtmvgmr3yixx2nyhlah5lchhjbhdkrodo6c@ugkj43u7mvvi>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c797 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXy3x/bm7+rO2l
 FmvLGoaCcONbUx1eljS4RdS5BkKkMnOFJi9+P9Xzw9cj7zuKzjfqEicjyDFjzpOFwAf8a7yFCHP
 dYoX6icJpqp5h7i+27v4Zp8Jtf3ZkVVOIlZWglLoyfT6kLxAhRotPz1B6/MH7A8MQc7a4EMgGvN
 i5zHQ92vnz56jHx6jHjDWpiiUvsuBOhrOLNYzCOT2G1UpieCm6R9TXqKruDuQzvNrnkMY9XsLt0
 zpkR9JEsBUE9yxCWb5HhyoQYvjBPCSSaRsO7cmzBV0oN/Mur4POIP0kTo4mYJw8t96BmoUVQVXG
 3Wba9QVIb5XkYUkxGcXzQpzIGQTkezaz24nL2wWgR46Vv8OrHeOjDZda6NvWovNuITcka/x/LtT
 tzi8qoIq
X-Proofpoint-GUID: NRJOIjlFgX5LdCPksP5q4BEVM2QsVTEF
X-Proofpoint-ORIG-GUID: NRJOIjlFgX5LdCPksP5q4BEVM2QsVTEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On Sun, Aug 10, 2025 at 06:57:31PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
