Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D080AEA9E4
	for <lists+freedreno@lfdr.de>; Fri, 27 Jun 2025 00:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5239710E921;
	Thu, 26 Jun 2025 22:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmLUJcLS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D211210E913
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QK5coN000466
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=; b=DmLUJcLS0w+IF4ju
 mlBGlsPbAW+fReM3XDpVtw5ER/J6uRpK7PbGvyeaQxUPwZtWRpBL/ajsNXUFfbQi
 aYoZmMoQw82RlY1HVAStmFw7q0ob8oNhYGpa+kBc7dayYbG6KO2J+c+n9TNjQ+TT
 5yHJEU5y05QWGaaBLGewI1FdFPDetApInyJuUI7aFmaay4Z/UMsoHU7wkCeT2m7E
 axP5Ju5NOUDA/woLlcrXbIcxSLoH+MqwU98WdW8tCMO+kG4J3LtBOw3Be/AeHSAw
 Bi6P/xeVKyW7CZHVpJFN1kHo/t/cxGuLH9hRUthSRM/KTwcjyiFOc5uI0H/SK+0n
 lWnrTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq50hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jun 2025 22:47:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d3cbf784acso361649385a.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750978028; x=1751582828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=;
 b=tUla7EFXuKjJ3yVZUfuFWiRTnTb5R9dxGZm90k9fz1K/nhlGfYgAu8wTH3Fc9xvOia
 fUNt4BrVEcMckkkphUWswZ54geevOB0e1HLfQqqOrjauzwsIKskEIeQnKEAidUTGx6aC
 8ajhUN/aeERIdJbtZ9yNnzz97l+t106C8CS46zYmSW5Dv4H4CqZbOneM0rfgHEiFM8Qt
 Xyjq7KQFuuRj/chFK4JpKPkcic2UtMF3xwxchH1at/L3W7fgXxp45Lhv4iSrRCpMoErk
 wMKciJv/UDGoPhk9yYP8LxtUGw2UrRBG+Nq1oa9ToxkKFA450lDlw9obU/0JkneIfWeT
 M+fA==
X-Gm-Message-State: AOJu0YzGBpCOcUe/bIVWBC7qtT4AqHpc5PSh/CM1i3TUBTd/ZSNKYGY4
 5OyqaxQVBb4sgIhQrCVtEikMbB0PWYUdLH+m831vK/hnkvZgJDPK44MsPhML+j+j1Uv0hnuFh0c
 pnN0AUMFBT9Ua82ACdxwM+DYF+dc2wLeWbuhaaHtnQL6wfA6Ekv3ygZmmO/EWhanLp9qslqg=
X-Gm-Gg: ASbGncvn8LIqnCNNDtK2K2fTZXmDIiaGWID5YqX1Mr6NDWV/RT4zh3OQVKwUBXhLfAG
 O8FtmG6tJ7dweVSKB3BdqXRHwBcOuRo7MBnKIBjP7PepZSaUY8GmFE5NEgP9x+ABl99858qYhBO
 nTADOBvGWDeTDIlbBj/C95D3GJJ4V7o30CIQm+i1h2LokWzFDjAejVy2J5rp9KNFywXRq0ArLAA
 mHyJk6SCiUjjycgzyp5UNrL/m0HRsqiQD0L6uP0yQQ1JeyZv/pRjdY1hFs813PNExKWyrurJSll
 T9YRvL3vicbh3T6DenY2fBYEFLAgfWe1iYE8Ml7VdwGwx10hlVKi4C4rT4YK3tve/E6VjS43NBx
 gybwFw6R86cO+scTFIXz75sQJBY0NG302Bas=
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id
 af79cd13be357-7d443992d51mr155164685a.32.1750978028102; 
 Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QvvBbuRQht/PX77z92dSw11SIpFRHu9NAfpMGbcKSTVTrTrYOF0CEnsJFm4LXzUIjnqOGg==
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id
 af79cd13be357-7d443992d51mr155162685a.32.1750978027682; 
 Thu, 26 Jun 2025 15:47:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b24e4dasm185172e87.73.2025.06.26.15.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 15:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Fri, 27 Jun 2025 01:47:04 +0300
Message-Id: <175097802066.519545.3760408226884035937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685dcdec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yB-vDBVxPvN9sSdsvdIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5NSBTYWx0ZWRfX90Id0oC1ufGF
 vI1gwxZ7GItu3ZCQYInEAwImiezJQ8tFmnWxbr30hRJfaAANmQRb0xmoGssgB5Znd2pbOlXTiRp
 mM6z6D9oiu5QQGdlClhpM5OQ3dBu3klrNmrih+yIOFA/4KL4b7AWFXDJGQpih9O4mwOuOIMbeb7
 hPuFjU8hONsjyiDAAPJ9/X6bznyXJWbgpRxTOElHH941AYeGv4FUuWOSFiXxcuqyGihq5IzE7bj
 YDhc4z6aMeR5N2MF4uNSAWFiq0jkLZrhoclLmydcScB1X4shIPkbtRmtB8gU9o6U52g0f2w6WCv
 IvWqkTNkLA52xg4/fTHqlVPNBc+Tkq9QUCR9JPFu1ggD/mr2ci7nyx6cy/hn19HMQ4iQzcl4ZEX
 C8XEuowRnKKc43PcnOHaP0ZmOPtmfsF84wVOGFZOXgOWAx74+37ODhujgFy7CNP/ms1KseEB
X-Proofpoint-ORIG-GUID: KV3ihk0mOSGc005pc7CdpqMMJPgDfvJ8
X-Proofpoint-GUID: KV3ihk0mOSGc005pc7CdpqMMJPgDfvJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260195
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

On Wed, 25 Jun 2025 10:37:09 -0700, Rob Clark wrote:
> GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
> fourcc's needed to import/export these formats, and/or create with gbm.
> 
> Rob Clark (2):
>   drm/fourcc: Add missing half-float formats
>   drm/fourcc: Add 32b float formats
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/fourcc: Add missing half-float formats
      commit: e04c3521df073b688b9e9e2213cd3c588e3b6e68
[2/2] drm/fourcc: Add 32b float formats
      commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

Best regards,
-- 
With best wishes
Dmitry

