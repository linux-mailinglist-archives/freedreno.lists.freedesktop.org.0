Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263AAFA0B6
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 17:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D34710E22B;
	Sat,  5 Jul 2025 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVwHtiv+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219E410E22B
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 15:45:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565DVQ39032506
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 15:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/5hl31AIup9VcraO0H5GHnK0
 /OM1c1STFA2QallXhVg=; b=oVwHtiv+ZtmLyH5r/aP03VJeVWYz+DFWjDG1czY/
 9KBg9HLOiGtVpCvd/dK705+COHYSSVEOkRDuhNk/pFwVWNuJR3Y+9sYEiBdcKDKc
 iDBbWKTFABQGp0XBTsyxL+yUFz5TydLBujRf/h4njil6v//vtoNm9cL+4Uytxm10
 vzr+GC73C7v4J3W0AcCwfEQOfGRcuRYkuRpNDw0CUMT5IYOtezbed90gXXIv103A
 wwi5prH0ZocjumEokBJSmqadyn70E+0tPN3xzLeAYFsXZKpGo59pqRs/1sHjjeW0
 NUF/kcrQiUEhz9dkKQ1yZ9Biz6PDaRbrLmty50DfQKJupA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ahg1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 15:45:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d4576e83cdso517529285a.1
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751730352; x=1752335152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5hl31AIup9VcraO0H5GHnK0/OM1c1STFA2QallXhVg=;
 b=o3D4YTZ1DF7//oVlFhrlApf4kpXfObfwun3E/99i+jT5d2l8GIl6BDLAXxbfqdHVzx
 E5yDVALTfSIL47IqmP9w2HyrfURr901RaQB+iXCBSyFZHB10weAub5ZD+EEpY/LqOWx7
 hD4B2zyUMG7ToG9TaEzca4o+CyvUvLUV85NalWruWfLtMfurSHTzmFyAMlT/9sg7P9l/
 TKwJt1bTis3KqkkSdR7iOALTEMp9lSqlieGOiICwPsf8nG3ZAvxwkB+Fj3N+3KezfVqe
 3Q7XZBJ5pcvhpa/inL6ceSvLCCnsX/O0XDNTDGHqdoz5MWbtpaibcieF1XRp5x2xjQNa
 dZ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK20IqFaeq67dPyFkoMvLWZpTtlPWKcL49LTj5xlTcKs+w9lYhBKqRRmhg4dNjlxWfSe6o6t/uWZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBDq6iIHs6U9DM+YzrJeQlAANGM+8Sly3+DIN36CVkhW7rHhA3
 Jj9B9X5Cn4hPTkQrTQtl9kJypTgYrc297uYG8w/Fa33R3eVBg8J5lVCxaR1CaXnEn088okxqzXH
 /rYcIkkcoxb7xDIZqNnYnrbuDtIhQWv5PwDLUH2GISZc9Rbzi5M5YeQThQ95tVy/SBey3ZMg=
X-Gm-Gg: ASbGncuztAg+hXSgZmvHv882Q78Q5T4ALKOLDFQy9umS5jgGAdX/xApnQnb8BasMCxd
 KIkzqBSWn7Ul9ynOFO+dXch4Fb0ONvAzm+zWBzD4UEeH+b54X0tvToIwdg6ypu9u1D77be09C2a
 qF6BFq+YBwzyI9c50otueUEduBnHhTZOZYa4LAKmZTRCZYr6HKzuVGPELAHF1Ofy53K8rh/q7g0
 M8fMU+PUeb/QVCanm0cNTtuktJCI0ggArWrPpZNlPHGyodisHKTQWFD0inZ8dNwqMqz3ozAybLu
 Nn4vSXaJfIE31PkfecgjhboWpMaV6MMmfC8v/5xCRowTExjwHyCi8PQhKEJfs3mTpj7RYFAkRAv
 UQsu2RnAuqTHP/FlOC6TUKJ+n3TwUrCO4/rQ=
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id
 af79cd13be357-7d5ef3ea581mr460740785a.9.1751730352391; 
 Sat, 05 Jul 2025 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdyY0C1qvB2PcFY3D1k6Eue1Nah+mBAYGZ3JSrRq66wBkfF8pUORakrJC05vzG4Q4M4ELeA==
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id
 af79cd13be357-7d5ef3ea581mr460736985a.9.1751730351976; 
 Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d906asm621676e87.81.2025.07.05.08.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
Message-ID: <kr7rjmo76av2mbobsgixhgdskak7nllsxghu2slmt6au3icm7x@japd67zoef77>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX220buYyTIwsN
 pgnYdNqyo8kWbZPPwTE9f4EXIozDA74fQ+WLqhSyzI8shXsJmEiOjrsc09Tpol0xMQyJRwapA0Q
 2J3SpIRMgUq/SYfndyN6/GBu8aN5d61J2p2KKZb4rwXTiSVT4Q1bxgxYbj0CujimI2a+aiNcDNp
 e6owLtjsWakma7DL9Re+fOmZm4kTxylrK8ooUSB7hFINTkjmKvu/64fdsMyd+eF+VZoWxMHJZcL
 xLYr9i9fxBaGnxJfvLPF1kka9pTfhccbOlHNFp7tV/WE7yM/DjwUAnqMNE9te1kkwtbaXeweny0
 2issRx9KwVDATAYt+oynOicdLHaKmvVlXSp2Qjpnk4nJCkaEYdC2pd0qVK7NbWwWFySuTSuNMMq
 94hV9hSsYBR/0e18grkDo0X0TW7YO3WVI6lMIpLoodgEubHfYd4RYd/DzrzthUn47PuTZf7S
X-Proofpoint-ORIG-GUID: t1UYhaWPGhPbktjaXtfcJhlS84j6aovb
X-Proofpoint-GUID: t1UYhaWPGhPbktjaXtfcJhlS84j6aovb
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686948b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YF7ZKVCZQUMDimIUfr8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=902 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050104
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

On Sat, Jul 05, 2025 at 07:52:40AM -0700, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
