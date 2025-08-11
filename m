Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E811EB20591
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048CB10E2AB;
	Mon, 11 Aug 2025 10:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuQzg8J+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3BF10E2E4
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAV4025352
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PE6gchWgUhiQ/wADu4ACCMtr
 JWOkRrEv9QXoDjpuWRo=; b=TuQzg8J+9bNzLvszHl0wheo/9IGGjtChvXLsCwO2
 y73TqgwF55KLwjVWLrhBwLXoggVdelQUYVadf3P9rQ2TlQWKZ8w8SSneV85Ui7lH
 BTwIIkYjfXO6wAbWxelBGfn7KV5OdBcaCuwYBAa+f0L3+M/Bo42bTqJL99e/751s
 GZ32yVAC8gi7Ywwv9hQtlURN4ndCWg5np1NQ3rh9IbLy6j6QJiCZoUVDfntaEVtC
 NXf6yNm5NaUGMWSH7opBibEBjmtgbF0bbcnzEM3NBaQ0lb6F3g8W4/r1qWVstbGS
 rWsMxs1Yo/15XCANUnJj9YB+oem3thraVjryUrp6row0eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb742df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0add6d192so61638141cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908506; x=1755513306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PE6gchWgUhiQ/wADu4ACCMtrJWOkRrEv9QXoDjpuWRo=;
 b=MKAN6QSHnQYjGTxafENIVyhWKn8JmvvwJBCjG0t3t5RMQ3WOHOZRAxjh9mpCAkkHmC
 3mH11yhJNwd4qujNnk4r1cvrJSRswuu+OyNddTbWS9SkL6gNFCXtge7BQNlGYLb5qBzT
 gW/zSUMgvZxCL/iKkD0kiqeng9xmVBGXAl7o6nl9AnHHSffuq+xQgrnPPbeRCRGRMhR8
 fNeB56vFBm0oFecOnP7HuBBcvqbt8tD7bNoP2Xog2dkyWOxOZU+hJcTtO+RZlz7Q0Pyu
 rF4vcoiH93ykimV6t7Lttj6POKTC65g0+1bm5yE26gyaRWWb6q2oOU/Fx7v9Vqc3WyAO
 5acA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8r2c5QEl2e1zLtCCocA2v0W2qgBAEA0K4l8KmH1YYZ3ymsnhzIBBggDfvfQ59yxIe5geXW39R6cQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTIfDXodMuIwKDszo9O3XSscWgRJ0I7vqpUVDHq/WyMX0SOy8X
 BboWCSPHIskkXCgIQyWgRqMsUavHbBeJIFb2HVmvGA7m5YbNAY7PWlJ1UoUBVVfaGlxpALI9E2c
 yqygnpfUNWFtu6GaKdQ1LKTadtqtXVk+cfxWSnAN64x+YDNKN7dmgpWlZHmVDUgPFmkUFSME=
X-Gm-Gg: ASbGncvf64Xlmf2IPOtTTeC5UKhSW3JBLRGC3e6ASzgvGy4P5feAPFlPlT7+zKUOfy8
 aRfPm3qPgHu36vmIFCDkXcHC16zBye3z+dLXNm/Nu8O7ssHDb8EZ7jXuxrkOIo70GIPZuYx8s+q
 ZGh7eHyO/hi1rwf55BZtUF5kpkJ9eC1q6n3kZACI24W6k1/VagphPEayyMHn/bIEv7TjFuE0qCl
 WabPcMdAkNGfk/ZjwjfNOSaoRoKBXTJyKww1RIr/FW51Yq1wQL3Ud6NhmDiATGWsq1V3gL+OlPN
 uSUaMcHA0NA1bpxzhb7+w925hcUViAUXNMGWKSCIxEgqdArb8zx+TFh2gOrIojX6vVXtipMDJaj
 pdSipnuFfuyd4cgsqt10hIbZPvWBMYfeUsd91Z0AYPF0iAZ3mjbuy
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id
 d75a77b69052e-4b0aed4bf82mr177683131cf.26.1754908505872; 
 Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5z1smTUet+hX/GcT1aT/9S2JjVbf9QV8q4hC/iCGMx16KAq7C3GFwGhrpRcaCu48ZUqvWAA==
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id
 d75a77b69052e-4b0aed4bf82mr177682791cf.26.1754908505440; 
 Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cac7626fasm2255259e87.174.2025.08.11.03.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:03 +0300
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
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate()
 to determine_rate()
Message-ID: <2q7yo7ad7xvxkij3jtelrqxxctmaatdyi6zavsfhwq6oga4w2u@woq2yrvdt5u2>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899c75a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pFgHjsFbsdCCtD1VVKhpo5BATpuElcP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX3tz3wkV+TpN0
 Ra48MyhDJbao1CCJ8ZDElfdvn/ia+Wfm5bW5bHKx+WgmcAv7H1c6nCQeQVS74l+DI+ehTO1sEbP
 hXN3eFvl1QEmiRUsEos46jt+wu/G+Zdt1SLzUO9sVrVjK6lf8lBVzaWwrmqD3g/OS/0aIvAW9Gm
 nniqpKhLy56kHNrmftgqn7ENF4nM+3g4iWhJK/B7y+BCikELk20eKesA/OpTkHq8VKH67f/E0vN
 AZmQmFQjQITq+Nnbnw7q1J2R1v5aFXMvQE2rzP8yrG0K54G9cbMwIQlVvNO1wTysI4RThfu8DZ+
 79gu3+vYN4X2ivGR6XdMUuD3TrYWtWzLmDOoDyM6IJ34mr2mGZXcQDQqvUHuCDm+Gdsg1ttPi40
 Z9a2CNv3
X-Proofpoint-ORIG-GUID: pFgHjsFbsdCCtD1VVKhpo5BATpuElcP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013
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

On Sun, Aug 10, 2025 at 06:57:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
