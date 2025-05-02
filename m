Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD9AA7C56
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 00:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2410E299;
	Fri,  2 May 2025 22:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZRc5D4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0210E299
 for <freedreno@lists.freedesktop.org>; Fri,  2 May 2025 22:43:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAp3P015469
 for <freedreno@lists.freedesktop.org>; Fri, 2 May 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CN7xAI5RxauZHSlfvB2dYCQh
 k2oKQHJwg6cw+tFAgxI=; b=gBZRc5D4VtIwHTesw8c96N0We8YMT9B1/H4e/S5U
 3oYIKUD8+rjDiCJYS++0hTrSNHQW/yllkOhaeAZk/5CFoPZ4d+MT8AfjwirCgHs6
 keSX1ZnmoOhr/N229UAKoi36p9S4gALDRHCM5wf8i56AOMMRFKn3QibqUPe4liG+
 jtBYahA/Kus2Ldh89xMnaJmhQ2eGqVwNY0yf4LW4/PYI0AMLoeZuXcfoFjbi4fF5
 a9wuRCyDx0X0IZmc4yZX0XnXFyjGine1RWPxsnS5iaXVv4KoIJIedI5EEcgWJqTt
 Nf/GOisGHzNcLKCwGaqC+IhZT6Mx7orcvLEihyJfnaPuzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u81jcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 22:43:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4768f9fea35so64267081cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 15:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746225810; x=1746830610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CN7xAI5RxauZHSlfvB2dYCQhk2oKQHJwg6cw+tFAgxI=;
 b=aJhVpx86ESng8AKMd4yDzYKUnZFTREW3R9+btXS6tcZVYnqeh9zvrvGqhPJQP5Efqx
 NmcoA88YZjWkx5b4csrgabaldDefVGNwpn9QhxDnyPft5mv2zrWFDdAi8HYn5rp85qbw
 4gEPmb0ilhPlkhGriGsbtK2au/1Tu+zOF52u5n1LIq2y1GSjkfQIAJOCcgw07q79orhT
 1tdsjq+Pq0S9Sxv643iOAC25CtKUuRVmbqZWJ4V2eXJT52m98ASmtfIHmMF6VobdhvSz
 Qo0TSwPBlWnKf2d5trFiFgFgsBhFAKBYPuGd0880muEVYYZZdQpk0TsUUVdD61g0tEp3
 PURA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWCVkV9a53Rpe5+05j/AsMg7thOw/8jitRdOlhcJ1EPfrMuFt+fnK0QcEd7iGfErSH0YiVbQ5Gp2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLC0uq1YQdaiPtoUwnHq7ZYUZthWkITedBIn13LmKPwNMILa3d
 FK6hVkB6QBi6WL5ZyQ6leli50PwZKxV+nK4vqha06GNX9HMoBCyi9aOJYpHeKVH3b1ocXiof+9f
 Dd2O0UMjJGO/Ox6W3z/43OIDbZ227AA6326/ranLAYga2TVURlDSiI6Rn90U7ML7lo68=
X-Gm-Gg: ASbGncv/cBbYLESlDgZIKHC8F+8f+WPQuGFiqU8fowBypPsAKhKyIiGMQzaX+mHpe8V
 OgcrZtE/XD+k4LMHp03qNo6UZO+FA3bEDwxzx6vdw67bZxEyRXvIPuGRe7HKpxYd0K3LDu0we/e
 QIz4otHnxQjG9enzVxep1HYWUBtddOHSC13k2t+MEBlh8Ugo1kDou3B4wnoEZLugNJDyWcIeM4O
 o5HMmr/TXbF0f8ebz8a/h1v6fGI9W9ISv+5BL10zPYR43a+nNfk4yaOs/sP9ZZH4RIQXTHqVDtp
 QWNz8jNaIO4J/mY2dXDsM8RAaw5JECcfxIuurkFkmOTrnyTYiZ05ll7hGEgnv/vzgGjSMYAJOig
 =
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id
 d75a77b69052e-48c31a224a3mr79130511cf.23.1746225810293; 
 Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyDC/ycgAmMGrAX3PIpDNuTMextZpMxyJBxhg9RzguKAZ/R/C4ebf5Fg9mF7ewzlpaMNVwpg==
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id
 d75a77b69052e-48c31a224a3mr79130141cf.23.1746225809891; 
 Fri, 02 May 2025 15:43:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a897cc6sm5072491fa.70.2025.05.02.15.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:43:29 -0700 (PDT)
Date: Sat, 3 May 2025 01:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync
 after preparing PLL
Message-ID: <b3dbtmqigdrazkhlu55r5tzo5w7ixf65m6y56nvqnaetkv6onk@xsakfzc7mmzu>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68154a93 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XEkVnyDaZeylL3GQtG4A:9
 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: p_T8XYgXw0g2ioPNgjctNFWGIZaWbW38
X-Proofpoint-ORIG-GUID: p_T8XYgXw0g2ioPNgjctNFWGIZaWbW38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX989eXAykT45X
 RsJfheZuUzTFWfODV8XqXuPfyxw0UzH303qS7jQziJmaaFHjbuso7mDCOJjNu9GI8nX7S6/zmeF
 k5nwvEXMUuj+UceB70GiDz7KEaSbn+iCDCRCZ3NCTgs+hbG7eiOf71dOrxYF65di7k47ec7RqRi
 6ozvr/i90zplgy5eMqXthWqKfVcEjO+sTHDxa4mH6ryooZV5LfU+Ku+G7qUZo8pa7caUpkx1PRq
 nwrPE/5RaIIcmJCBk4BgAM32atgx99M+koTaPPxlr64IEVmOdPhfHjgM1CNdbwO04jtokntXibn
 BJK8+P9FimUmOHPMGo1uyF2YCf1K3oDg7UgB23DY+thCwcJyyTnt2tRQiQJ8AWB4TgWufYGGe8t
 lS15rDX1YexxFAfYhicvzTVmuSPA8CdCQfg8TvIjwZ5tgsy3GQPnnQHWh4cFVyZtu5ChpB2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=789 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:44PM +0200, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning of the resync FIFO buffer, but never bringing it
> on again.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
