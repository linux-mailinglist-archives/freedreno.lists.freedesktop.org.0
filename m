Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30265B2059E
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED010E431;
	Mon, 11 Aug 2025 10:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTqmBZqL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAAA10E2AB
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dDik000685
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8L9FpvsfDpsj4VZq/OufIKbL
 +DTyr83VxTwATCE/HEA=; b=dTqmBZqLmGIfBWZJKBveSUIWlAT5tG+uvmHYJqQe
 Bkvc8Br581Q9qZNHpVI6L9Xzl5tKPGW0vNlBiiK1/Q8MejUyXmoHXTD7BcAhG91W
 wjajFi+2gqeiC4JdNr6MA2gJWE7xpdkBQ1C42Rz3N3dh6OC1EyfT8KgLK14R71g7
 Gz0DpAHLmm+g50WogaaU5SXhSJmAnwTT/dQQhOpNt62ykFxRwzGG7x+/M021sWpx
 3Re7dqn9dtv5cgz/kazTxkJ6l+TJtnGaaM0dbAOtKr3Iy9vNw1n+wfeA1F5AUKwl
 oHyAatjE3pzm5TfKHwNbKtuz5KoLhxatdIEoYu1Bb8RQsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kyv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b08b271095so116996951cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908555; x=1755513355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8L9FpvsfDpsj4VZq/OufIKbL+DTyr83VxTwATCE/HEA=;
 b=Agw6ZdHHbxkPgTxUV0qIdSZfqTWWHb/Klk0k5GWia8N6JkA/F6UzHYIM/ysso1gQhB
 OMe3YfLXcWh3layMtap4uX2Uu0GxFcmQ5/BKitpK2kYcW7HJGsLvGofYFrGCmI7mcO0f
 Uw7JYLZ3Zql5iSgVmBgGl48PDrdDIfGRwoISHFoiEJ5ffk6XK9JuxyBTfT8CX0oEPV7E
 wN2KMd01mRu8p/PuIr3OndLxOxgRcKJdiyU5bL6T+eQ2xdZxOAV/t7cZmSdMDmFBgJD7
 nj7JR6A98gUqY8EFY1CzpvO7pYxScZzBf0xqM83uMdG+T37w77axm0la/IgG5F253BxN
 /6nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEOut1hxHvG6JYml3bP/a7MEH6DBwMN3U91yfR9m37oU/52Ab1aRrYRqh0kBDUBOep/uLod2f8KV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmS8rFrkd91yG08iTQqvkWwfAcxYWgBQiJIE8hSTQ3cTKU6OO3
 zsj+2XCve/Pxrkn9ytePzeu+EiAmaQ7khMTsRJT4HDLIMKoo9rJIirxF+Djp23dsvytr3BS5sJk
 mjHcr1xhSiOLmZwaNuauC7TNxfhgyAdPWVbJBffwrkoCQvXvJaEYXwg5ijLUPzkmdvURptGs=
X-Gm-Gg: ASbGncuv9c7wBKEUPl/0sRA/ZmkoOdW+jnbGMk8r2wZ7v06ABRHxpKRd1GQeDVBKA19
 8H+IgHguR7oPdWFxbHVh6a+dR3NBJkykn44FTrH7qDealLMZ71hRO/6Muln3X37ymH3w+QI+5Vy
 aV/XCa8trDVRnmzEmsjis8wckTg9lCPwVqroAmaXVjwYo9ISwDCDdE25SS5o3/HPKTk4hH4N2kt
 4lbLCBU78DJul6QbSj6VfVh0J/FMiOanIgZEJipxPL+ykILktPlopTVGEe3jc9i1lrr5DpdUHKl
 LR6LW2xlnjnSgdMN2CEPqnidzYO8UWVahD+T1QDEOTMG/PCmFvlr/Pr2GC922giEuB/cOU2gYcw
 YcHdBnqq5ipMIlE+8GjZr7WggS8fvubMpPXGVLwX6iMvJZnEleG/3
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id
 d75a77b69052e-4b0bf673f18mr121727011cf.50.1754908554706; 
 Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGSGkWKky4fViZdB9BU2n85HeQbATJIlEfA7+ozin7bCsrRVF6S+s11E+zYmbw4+o2YtN05g==
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id
 d75a77b69052e-4b0bf673f18mr121726581cf.50.1754908554193; 
 Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99083sm4268055e87.94.2025.08.11.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:51 +0300
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
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
Message-ID: <snpidtke4k7cekzsbhs7vytr7gaoc2zmxadixgmedo5gtne7tn@laybummcgllc>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: 4FbIKnb7aw61NOopRPQsbVwkBEqWj8GA
X-Proofpoint-ORIG-GUID: 4FbIKnb7aw61NOopRPQsbVwkBEqWj8GA
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c78c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX3h3wNL67YLs2
 tJIG0WYlbOqr9VF9Cnl7jUkEAPWbpob6wII5ZYgKHoLlRlii8obvczRUAVRY8TG3rJ7IWdJP5fU
 Br/CwBUfwcpzoiN+L1DOwa+ImPAppHAnZ071nChu6yCuh2JZEk/VHWE9ek0BsreHitXTpf2Tab1
 MD/FZK0MOqR2V5kzD/+bZtBl3eTZcZJIaBOAWZqO+XEE77zrn2QV80nHAHYtdxfkAPrRu3qJTqw
 QTIV0Vtmu8Uaq6CRfNi70HDlSz6q9GqDPMr+9zoLviFmpwDNNo83P54RxTdxQ8Mve5fxeQi2SUW
 BxG4cqQDPnfBMLE0WzsMqkPscCGyp6HPd78fPcbxMsGWCS/dgzs2RJiaPGDqJ6QRWcgZntxova2
 AcYjLZlI
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

On Sun, Aug 10, 2025 at 06:57:30PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
