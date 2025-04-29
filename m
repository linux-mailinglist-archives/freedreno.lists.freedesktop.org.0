Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D312AA0B2A
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 14:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270BB10E309;
	Tue, 29 Apr 2025 12:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823810E309
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9q7BE000859
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
 VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
 60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
 sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
 kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
 SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
 DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mf7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c9255d5e8cso1036863085a.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745928577; x=1746533377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
 b=HXM4yMcahCKPdCJnv5EM8B1d6OXARIwofN5eWgi7+G2qGeQm6qB1Xscvc+QSZkYYX4
 g4UI6JWyGAwxDOeZdF+oKiwAcoz0CkKftHmkmPrzSMT7Fx1tDCs9TrhtJxXkwsBwuLZY
 U9SHE2bP6Rz9XojvMNxgEglJgQ/jayhroGsa3N0kX8GYvKriGNlEiF+tIF/lB/8KHcS1
 kH/r3cT3Laa7a3JOPJAIA+NWDo8gWueGUinSx55BbhT3gqlp1TIGOMHjE5NGJsLMFpvG
 naJFqV81weGxUfDpHXyEOS4AamulXFy6tiu1ocwnAya9aNZLxTMc9hD88sDcy0W6WXtz
 zGpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU77J5gXsTPAqU7TQnPZ6cOZfkHaGai7/MCCAOI7sbMc1KEcP8zadL9dh0/0dsuqWLcI/rDGEx+RY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYME6JKIclMXjgVgrzytJB4XuoA6/IwaCT/rxvnljvKJ5lLVdf
 GLU2QC5jxt8i9U9Jpy9uENJfqV7bkQ6dS+hxfRFgWx6B2mbzIgIe8ck3Q0/3dqBrgmfwEFYI3wx
 6ahbwryjlFB6YW08i4dB+i2PSaaUrBg45i73Bc+QsO4ZugmjNxIrq7bjQpL7OoJuNn8Q=
X-Gm-Gg: ASbGncsJAYs1fxIDN11KB4OJKKm4fxmS9+Gok8LFCTRP8Hgf6jNApPQWkCf3ywWUR9W
 nhd4J0ifaOBQLw+x4wZp/gOkaKGSXsfGlua9WgTyFG0eOuxMtm+yhY5VmG5l6owfHZ48xynCmYX
 zeQNToONJflZyNS6By2gdtSCW8taHPL4IEpvA2A/mNg4Pb07yAUqPlgn4MTw1ccZow/r3x5XOn6
 eLp6hO0gMKA5KY90hig0w0kE163Vg7Up0FpPaqwI+mJErefsZciLoltw1MYQhvHH+w8rZuPNTXV
 dUqKBs1stsuCkfzmEgdX+vnDePbDIO0c8cucFS1pRiRQyJTT3zSIAgod2tuHrmz3jSIQVhLWqjY
 =
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556720185a.31.1745928576965; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c181 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ZtpC0xqPJJziYcnCS5bLviT_5fjn3Rot
X-Proofpoint-ORIG-GUID: ZtpC0xqPJJziYcnCS5bLviT_5fjn3Rot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX/Rq7r6tN+1Os
 kQdG++ik0Xafl4GvKPIDfDUBLW9B+yY35ZcvV0JP0tCnkHEs+/6PhtHLlT0HTKRz/EYnqtJ4ad7
 AafMapvgsXHMHiX/+/c68cFptZ4sSrg10anO4Vah3H3Otowqk4H5ZCZyjDsojrHZmSEAtGSZ1Pm
 AQLm9U3qmRbJE3uKxV5IANfuNmLiqfXpllUepehk3nM54/PTmEeC0c7tLPu5WqdwlAMHj13lAA0
 xWH0BeUN4myFRTSGiubbwU+Q7IgbL2YDKDM6PDj6QwXhFin4wdug+LPjFN1Ih/yRmO6MqynX0F+
 qolUuNQEmGzWs6KFetoxHVSgesAG9PpNcWEaegBLDaeEIy9cRY3ddki68ujsFMCCB1Od/sBmTEo
 RW1FDsw/nQ5IR+C9otVZFhR9HiUfe6eLeelO2mZSeUsGtLlJKkoONShVgata7VhT/XC5oKl/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=842 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
