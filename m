Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA7AF6590
	for <lists+freedreno@lfdr.de>; Thu,  3 Jul 2025 00:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6DA10E79F;
	Wed,  2 Jul 2025 22:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm6wrDXh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE3F10E79F
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jul 2025 22:46:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DhZtj000442
 for <freedreno@lists.freedesktop.org>; Wed, 2 Jul 2025 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nGM9DZwF/Fd/OQyKb81XdMAc
 CKZwqXE+v9fpqIkuHk8=; b=mm6wrDXhutFr3uHC6qXUeeftTGzqIOoRT77c+zOW
 KhrL5iogdPPtxctY+wOJyx/UCrc2keVFfwbWeRsMeMlVGpgsHLtg+cway7Y+7/mX
 1Fn33tizx/wqTgjlkVDDnwTdmVEJFgI9auaXt7NBQvF0YSHAq7Qp+yqrtparSEJW
 fpkAuV87++k+c8bWywdmd0yy/lkbLtvw6obky8xTn/GsvjIkMzs0CdI2BnEKfnZ9
 kypp792UseyoI7eeNSxLzZOBd2W1Kz1p/GkaKTMys6rWd38STbIMs+xarMeXk93J
 1iYsOlH4donFFrvzpib73KIdBqDScU5nBpzLrcBtTrrIHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qme4yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jul 2025 22:46:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d099c1779dso680411885a.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jul 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751496362; x=1752101162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=;
 b=M5mmx4Y7aHiuigRayHBcbgZilUj6g3CmN/M7hwsg8EZ8e3l4QQ1fluRjBveDiYgN14
 ybqCrjUXciEw4gTFZCcqHWF/CllaqjFrcldJEPBkkYRAmvEru4pSbqAU0LybsjLvwrfD
 GJhEIiPUIajjp6R5xWUtiRvYaMHU+0m+ef497sGf4RasZ05bGZJX18bfRzbY/27sZlqr
 ZuVobd85ha5bbhqTYcubD7+v55G7E4O+j31+LkMbudw82lF/pBi81dVgUt8jSw+Rerag
 yJjQ+43RZVVyW6hxJnCxCLobLJFL+ckyC+9UvUeLYs9EeHalPd+bZvA/5S0+kLQ1xvLi
 btRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3KZenWlJvnh8vpdj4IwydJSUp5eGPTs4hDdviMWJlcqySip32tonxjsBC1t/R+IR+omcp0ILUBAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOFsUnGtPye1NAc+hohECQhbVjOWMdZs318flFTakK4zSfKLNV
 OzbwXIJmUvqZ3koAMGfjbshM3qSWbhi6CGSdtn5JlPIVFFIKuzsX8yMDXXwuMXAtxlfKY82oKmm
 OVL53ZsIm2/qWAFNV7gZe5QaLdXLTfPZ5NPEcM1ImANPWcswh9wbhRZwSlxTO2XEJgPJSWvU=
X-Gm-Gg: ASbGnctqHiodeyppTamkGh4v5NbZcY31AXPLF622m9wunmVZVR+V53rn7po0r0TLjEw
 wisZfEHgNXA4uejDKDQUVmBozFjtq4YclLywAWm0O4ZQey0SLM4sBXn0HCAvRxQRPhNlY/nNHlu
 LfSwv6SEpmBGCj0jtGsqOdZ+JONp1AUGqNsVmy/6UfjzL+IxzIYM9ExqhWmZHa0EoKat0GKOVmC
 IO4u+dMQtond6E1B5CFA3OPRaDai1yMkhPOeAzbvPoB3U+PUfVvoPSUKJcgOX4kq4L1iZTqGQT+
 UNxi7HpeDer+t+hm/pQiNWPCcesEPPzFweaA8lI7/RIuKCLsXRQLkyR8w+EQswX76HhoJbm2i4l
 oYiuDsFbkDZGZGz4F9pD5LiO1eBhBr/Y1dfY=
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id
 af79cd13be357-7d5d1478c26mr195296885a.41.1751496361820; 
 Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZ1KfGDoGnAnKKb48QCXInkKCn1fPiOPT/0wf5tLma0vYWc3UfPox1mlLLdjDhi6HGr8ihw==
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id
 af79cd13be357-7d5d1478c26mr195292485a.41.1751496361431; 
 Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2eed872sm20589301fa.86.2025.07.02.15.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 15:46:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep
 the same paramter order with get_modes
Message-ID: <roqsr25rk6psidxikgj6gejil2n6yne5gsbuvbnanhtpuqivj6@fqxazmw26hru>
References: <20250702111453.102539-1-andyshrk@163.com>
 <20250702111453.102539-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702111453.102539-2-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865b6aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=ywvnwGVb1iWAczny1xEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 98t2mlh1mEcphnYUTR1PaMCEIrti7VW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX6QDNL33mf5gf
 vc499b3a0L8JokfYQNk5qMuj0FsEXW52Qpbn/Xd6BXTDEMgFEeqXZ8iGrihWM6/8sHAQujms1cu
 WnLJROI97ETVQOv5yBNU5Sg87s+3LWoNT3mPM864eTt6c9LTUQzkg5Fop9GBLynpfG8BrmeqPzc
 EdCuUOp4rS9nVg1B3/W33Qa+id07EbiHUWScYr7Lh2xqXLbT5Zd75jpCg3I+dTRcss2nZVEsWaB
 tMxMIXtxPIqNecsFIKWtq0yorTJ5z7Hg9m0PjlNM1cEDloRpQRuPZ6Xe74dV4KO0foRCHj/Ew7n
 u9VA5tUQPb8TE1gibSVRvBzfA+EB4WrXmB8pyaarLnGqWN4L4qD1yD1oQZYj3CbOwuuZLSwys1G
 X64OHJqmSWWUjmdUx3rlaYTjWdBgUepGKT32AWzPCfesgkmaJTK6H6V65jdNlcQzVAEoVpKw
X-Proofpoint-GUID: 98t2mlh1mEcphnYUTR1PaMCEIrti7VW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=785
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020189
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

On Wed, Jul 02, 2025 at 07:14:43PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Make the dp/hdmi_audio_* callback maintain the same parameter order as
> get_modes and edid_read: first the bridge, then the connector.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

No extra empty line between tags.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
