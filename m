Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7FCBF9F3
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 20:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A58E10E272;
	Mon, 15 Dec 2025 19:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA9815ys";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHtoYRs+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6003010E272
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFE3oNc4174109
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=npDpDwwknv3Nv0rm7sBmaNw+
 jfUIH3g4Ct1bpwv9dlU=; b=kA9815ysSLA1IprbX75A0yvOCKefM2aPGJuEjxQ9
 vx1/1FaEDmAtdI7azSdkuWoz+F/VtpWt/fmUSr+39yvsBC+CKECROXbK1f+stRny
 FepD3eEovM0EW0e2exMPAOMLRdUU3VgT6E3Tzng6k3L4o0eRQPP7+824fU9mzaw7
 Ufkj67uCjH2B0qBe4czDrwdguO4EIjBfnO5ld7rgbA3lL15Ce0hMrmQEQvOTk5XO
 82ZsmuZf9L3ziNElyIXoJ1WNBzMwy0nSROg9xxvDN6174Zt6vYhm8LQyDiQMS0mx
 JuGtXIh1pw8/irv2680o32vpY8xvnBPChUl9Dng50mAFdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks012qk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:59:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88051c72070so68722606d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 11:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765828746; x=1766433546;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
 b=RHtoYRs+rBtlgLQfIL0U+uPplWp+g6KjcsiOtJCnHGlwB0HcY5SM52RpiPZ3gyt0Jh
 wzzDD46dccs6LSbh0DIJaAgINlRssRSyr0Gpsrnghfh8k2U9x7Rc6YAVKqMaPvABddd2
 sgwYHOHMPmOJargKumWwdcFFsmT0oc8ho+YNNjqRM65sV05SYuaMqe8rBxA2ECWIJzfG
 GaP8Xmw4K0wh3LQdQB3fS2fcIPqSHwT/YHJu05bXVKvE/bCDDYQVjpJBN+YJo2y0ltn6
 NqVuGovwWQU5fPH8zBzK7i/Qc0TTA4FH5cLe9bEj7yZVVFJW90Gz6tl3X+CUDt/xkwfc
 oTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828746; x=1766433546;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=npDpDwwknv3Nv0rm7sBmaNw+jfUIH3g4Ct1bpwv9dlU=;
 b=AHpuwuKPrP8ptsjoXi+jhmtWN4SIM6RWJ5N0E/TCteEynyp9uAkW/gB88QRY2qSXNR
 YkhzJjfkdPfMSRLONXQ2LvpD2gCPPg/2GM3H15dZB1I+Y5HQtLzCudb7cPIpCGTxDaAs
 7eMLRKAS6iKwpF6FJSMnSRtyrTMeVaLUaNQruGqz2CS/Idy6jsoV/1tsduiLO8EfAJgg
 8sCr5reYl05gD5duBjVPKGOmXuIq1cfUksMwL/quB87eIVeHF74k1kJVOGl/dqJrnIjm
 bb92WlF8+OnWxAU4lBtkTKIn8HEnXvfEcPQmXunAo9JKdvKidPVbZNU5OPZO6sK8XeGj
 TmcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjnj2vGYP3zarZtQoyNT5cUE6z5VaX+LpVIqLn1e/oG8BLKPXDVrW3K/aW27iw04hNejCgscllL0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUk6WBTk3gXTMtmMuDBHi8t9hu0+NvMlCFVSepSlmH7lHfQIxj
 41PyOTbqzQFIV8kxh6VoZuoWWciKLd8CPHXUs3u/zy4y/SVB5Bltgc+LU4Gq1cXAgBhiEX/dSTt
 YrzswGBtm/KAbihFEJvEiMntOXWTawRDZlI3M9IDRLE8n4m2QL6nZgA+qEuasodZLFfWh8t4=
X-Gm-Gg: AY/fxX6cHCK09uXL65u+wHK8l42gFUp3No95gd4ljnWD7fBHmY58f5UxGnq6Xjoj4PI
 9ci4Vft3Rt20ygntaSyqzZNEb8Ew8ukA7Sfb7a/82Cp5USWsHQmdRSnJ6mMHMPF5/N/jy4FLuqB
 uwXPP64LzflYVWuxieMv1dZb794yRvE5f9hxpkxgOlRofoj4jvtJeRHcyJ45nHkBMInv2dfU8+C
 Uf0egBEuYgZtgan5TUxSuO7Ysw+Or2l590IS4ne00Rg9V86qKYx3LEnuouhgdK9XNk8ZQ3YC9bP
 QBsP3ZS4c9duVfBwBKmb7BhgOyO1gBo+Y66d9AvZnDf7Sw56z429Lcu6hW4BcxbjN80UzzjuRjo
 Ozgwu5FE5Vn5RH2IMh6hm04G2fDpw5rkfhbg1Mw1TXYU32mUqdSUeWq9E9CXuDBtDCvVnpp5JeR
 66cKQL8FElkVATIGKeO0UH8JE=
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id
 d75a77b69052e-4f1d059e34amr158794891cf.47.1765828745909; 
 Mon, 15 Dec 2025 11:59:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElabcDphYCb71EoECRtI8s9ld2SxQ9xgj42DnlJMaZVGMuKd3guYQKxl5DIJz3IH+agPET2Q==
X-Received: by 2002:a05:622a:1aaa:b0:4ec:f940:4e55 with SMTP id
 d75a77b69052e-4f1d059e34amr158794451cf.47.1765828745352; 
 Mon, 15 Dec 2025 11:59:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da503absm92224e87.60.2025.12.15.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:59:04 -0800 (PST)
Date: Mon, 15 Dec 2025 21:59:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <muo6zpkb6esy65ug6pd74xphl6inagleogexu454arngua334l@6rcfjeqyxnnz>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AnllxBEM86n_BYQ3egqbamr62LdVOXP9
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=6940688a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FygwiVb8ID-HIxUyOxIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: AnllxBEM86n_BYQ3egqbamr62LdVOXP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX18c3d7hA4cPw
 BCLFW2JvSjikuC5O1M51F9PBMYwpOJmDWQEIyrSWLFxZxoPZh+AT7TTsit9O3shDPp5hD1YOtJv
 HvRO+SKqSUr2/1u9UcLGcNB+206JqKPsYbOtlpoTvNfPfNCBv+ciFUiPwFCcvkEHk/UucQ7MdGq
 IozUJKhZrIbqz+uZj0o+gtOPy+babyM9wKzCxOrAtHBeLziqpwT9Zt5pwkLj8QX2X4cN9Su1F5y
 UhIMvr/0IlO0Do4W0Z3FDB76fie7FhV1ANFvAbPCmxqhUBMxYij4cZ6TGP9pEmzrgeudNR5ocxH
 U2/JJ4wXgaB5pCbnfTyA8Gy7yfMw6JetKcpAt6t2TeKc76VRT/QSLn4u7ii9BO91PLceMiNMOJI
 EBTS/BdLO+hpm5DsB0nlrFDt4vzM9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171
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

On Mon, Dec 15, 2025 at 04:38:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce

So, it is Kaanapali or kaanapali?

> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

-- 
With best wishes
Dmitry
