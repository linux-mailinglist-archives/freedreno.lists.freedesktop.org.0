Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADBAA9308
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 14:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21C10E3E7;
	Mon,  5 May 2025 12:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Snwu1JF6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4FC10E3E6
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 12:27:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451QSSj004471
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 12:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1mZ5cx/TFXOUdnYEfCMZ+itC
 mBzAFu0OJ39D1ob48qs=; b=Snwu1JF6jiDnY3FnTue7MIWf3tpumP8RkSw4+rAX
 67EtRve8C3jCOXwHxrZMnE5UsZ42i/fBuvqOM8g5j/VbQkqK3I+b6GHct9/tvlkk
 j3Qms1NM4WIORBQTCvXfBMf0wx7PWUHjhXhfjpuaWdS0gx7fJwa4h3A85GGdaTt5
 Y38zaS+8VwCrG2zORN1ZMka5guvz4/k/EZgYjqVgHIGrUlZreEYegpQEYC2QKF3P
 XAg+P5hIuheUREnqHtJkExAWD7wDigOAH1pXgF6IBJNNh/BpcsBYVmlrarDXi2ND
 AMTlKBEDDoqpxABuxKaXeTdTtX+ex/YhnVmyl9L5ILZY3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rv3q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 12:26:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c793d573b2so138555985a.1
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746448018; x=1747052818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mZ5cx/TFXOUdnYEfCMZ+itCmBzAFu0OJ39D1ob48qs=;
 b=K+cDt1mH9frWQT8RLy43WlrZNFVLPOhizPWiY7YfOvkTq380I2nwWvmjg1lLkYBfjt
 mW9y5ImWnW6IRR++796/8oKJBwAXpCSx7pejoo98t/j8+qINsY6FjgLnvfjJy6DJyTmI
 lk69JzD99LXNp0COCZPkT2bMlsPu2O/J4g+oPr2jyyGMqIicNlZ3gWJmeRf4T70kOoN7
 LsH7E2JnReJbB0rxZNG2axZvPJLibMMDBnjGN4Z6MgDz/TVFxK4viHVPTHJDVD5Jndsd
 U7O838eAmQbY7zggRGcVAphM+8Bs7r0/w+n9y+67Oe1iSODgiLX+Q8Gv+1v2HVLtvP0q
 wbmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa18w5w7fX5ArLwG41KSov6YZhrDptwcRBTX1+Erd1X70hnNQ+018R1/NSRUtE9nbq32zyXjRS49k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgdAf3LLd51x6LFGmwRpA/b5EbibvWJMESEbpM2ByMphP1tluO
 UNhAq3+UNanMDp2X/Dyb08ZwDW9u9CrvAJOJYrEVYfc6YRuC3pEXgI7vZ2KeBzT45F72hjiQPn2
 212BJKqmyIZA8Lkoti2gmRBVCeZsgC7s03LOGXmi9fGAhZdsNwrnZH4uaoY/ZSnI9ikE=
X-Gm-Gg: ASbGnctP+EfLs3iVuJbALodiFDoNnDRIRn7m+NeooAdwlScghZZhYQVidxUeuXHy00I
 QhOrbrTYUCivUtWTan3WupfTNy0ZEQ7E/hHZg8ESaD28VxC0/Hd2gAj+FDxvcYSWUXwUcLyuabB
 3Zk+G/161zxJ8s0VCnAsqUWWl1SxvRK379UUbpgPc7s7hHoz6GbtPRDin5q4L/jjpQdxPvTdGLG
 mJBZ7Jra+WlsNwLnEKjEHg/SFdEWqS1tb+UfJoHAvSl25qIxGiuzaP0Ci91dkCN+IqMNDdCez3T
 w8GTPW5+ds3e6mSrl6EsUBYvwXXW6Qq90Dtm6mODHUAtgLWz1KLiRmsx7BmOYMT3U0Ndcx8q4Ws
 =
X-Received: by 2002:a05:620a:44ca:b0:7c5:f696:f8e5 with SMTP id
 af79cd13be357-7cadfdd1fb3mr1066502985a.14.1746448018588; 
 Mon, 05 May 2025 05:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbP4vMWfoDCZb1OxRZYoOdMiV7yVyeGR4Et3hvHSFh8b7ad1aFuUaJ40fNUggHnRpeog6jYw==
X-Received: by 2002:a05:620a:44ca:b0:7c5:f696:f8e5 with SMTP id
 af79cd13be357-7cadfdd1fb3mr1066497885a.14.1746448018233; 
 Mon, 05 May 2025 05:26:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32029017379sm16984351fa.31.2025.05.05.05.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 05:26:57 -0700 (PDT)
Date: Mon, 5 May 2025 15:26:55 +0300
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
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Message-ID: <d2dh7lolcc4h4jr4zytc25tjcj4wyuoo55wk2vs4eaqensynme@txkk56x3zm4s>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
 <ahx623ttvzd62u4fri6iqguj7mirlf22tvwbu6k2ngxw6hwbcp@oh7mmex5fjmz>
 <5c307e88-a3fc-430b-8ccc-af59e2097da3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c307e88-a3fc-430b-8ccc-af59e2097da3@linaro.org>
X-Proofpoint-ORIG-GUID: b2uP4ZY4ZFuduZbdMm8Drb86UUlkwdt-
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818ae93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=GiW35wlXn3FmTEwGCggA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: b2uP4ZY4ZFuduZbdMm8Drb86UUlkwdt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOSBTYWx0ZWRfX6XGJwXVGMGb7
 JpFjNpkCCj6farn9DJoLb+1X14PwGCKmDp9oA2YhdeRbks7h6LNcRfexZHJbJhgPNAY2eUOtdMS
 F+1fR+yLVFXuQjYBimdoUJT/Lu06qGob1ZgvbKvAzAwDQRTVbP7BcyZgNxp41rAjDLbBw2zmFn/
 t1dFVgX5SgOTeZGA/KXO7QXjRimiJ5GY9GIp86zwYiF1NPo0ctfmmoPtAZfU1lnyewRpfP0K7Bs
 AchMU2xcwG1ddsHKewKcf1VoTktWu7xJ0bKuJLom4IzX8Lh3LIQrdSwWrPeCjdspQt5E6YaBZdF
 JGgEK2LwBohudU6kpM2prapcE0nuWOte72Wwihfrd3zcQHtkJ2+9ESeRAPg0S6ZOnJYAl6ctCng
 3cGCpx+idkmrgRonFCwn+mC9Zxa56/nivowPcY2c0LToCoKVsFIqim0vzJ3zE02r94lp/ecL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=731
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050119
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

On Mon, May 05, 2025 at 08:45:01AM +0200, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:52, Dmitry Baryshkov wrote:
> > On Wed, Apr 30, 2025 at 03:00:49PM +0200, Krzysztof Kozlowski wrote:
> >> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> >>
> >> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >> parents before DSI PHY is configured, the PLLs are prepared and their
> >> initial rate is set.  Therefore assigned-clock-parents are not working
> >> here and driver is responsible for reparenting clocks with proper
> >> procedure: see dsi_clk_init_6g_v2_9().
> > 
> > Is it still the case? I thought you've said that with the proper flags
> 
> Yes, as we discussed many times - this is still needed even with the
> proper flags.
> 
> > there would be no need to perform this in the driver.
> 
> assigned-clock-xxx are not respecting that flag and anyway, even if that

This is really strange as the flag should be handled by the framework
itself.

> was solved, they are executed too early - before PHY is initialized. You
> cannot prepare PHY PLL before PHY is initialized and enabled.

Ack

-- 
With best wishes
Dmitry
