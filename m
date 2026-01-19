Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC15D3A6C0
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 12:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858310E3FB;
	Mon, 19 Jan 2026 11:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP4RYpxk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9ZvaauR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA6510E3FC
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:24:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAR85o1661133
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=; b=lP4RYpxktNZWtH0q
 cczG7KgpgT8mhMgot0FCfT/iPmEgjUJ8hI2Na734lgGTU16RJ42ob1StxS2t5JwI
 z5GjAZDFI31SC+APbxWAjKVWJ++/4tsROZ1Rdz+mJfTn2OBg3D/tOmBKNFAe5cqe
 GylGiQw3AYCDStqghOIBxXD/j3kxoDl3tbDQhl8b9nbKYbc8rJjKqtOiDHo/XwXA
 b0TGaefzFeBiUew/1zuFeSW4Q14XZsvIgqprTePPqTL+wWPnhOq9D7cKqpCLRzvS
 L6bD6KLXH7pDQRZYJ1s7FduXAHlQ/cKZTu+oS3N4VDKep4jMvpqbeberhWnoWCIc
 o1GfZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdr5md-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:24:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so234866985a.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768821870; x=1769426670;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
 b=D9ZvaauRvj8UfANxzcWcanTJWRXulRUioJHXs+H7ptMmiZM/RMsMPLNbIIR91PoVHl
 YdA/uZXhcmeDueP/1gELzGsmYM7TtBRrOoV+6qQpIEZS5ALYGMgsBbhlGlq7vIxOnqcY
 eQWBitUVOXobqZOpNcywc7vlJAtZQf08epWMa7dp96jHdXTK2OjeCUjSPfqKKAW8MQam
 1gO/ob/Q4mf61U2LopmOPlgGgOAd/Gnq/yCfaWRLBayHdFE9cgox4JsrqT1fZ7WHiWfP
 ElikAKqk5Oa9daxEpkcGO9E4iD6eqqXIhqVdJDCS5YFMnmi4Pg+G/OxxMm0a6DwsTG6t
 cmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768821870; x=1769426670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
 b=Jhd74z6HCHMvyIavJLwYNm31d8EceFv9BaqRbIcwRt+B652yBCC6II16yHO54g1D9y
 ozZf88576t6MurwLAocw9RZxJz3Z+227DOfHEENzYDsdIn1UwEWc4LhRTz4fspIcE/JF
 Er1ZbDWBpkD3q37jkP4RSjiAD5gkzFN2KXHRDsau0bdNJQnp9vfsVhcOsrkL2SWVAF97
 qc2jXWAN2fVxfZsAHYi2X5D7zX2VlTKUxkMdGzKwJFrivlSBR5Qc4eYtTMCrcjkyfRLC
 0s0HNuDV5zU6Peho+edvOfjmudjgAim9eosCTFcFN5oQrxyXQvug0v/j6imy8R9mbWgt
 bccg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvYEopwpph94n5F6tJl2KbY+2Mj8UXXZUC+yhjxD1sjJeL7aYL80ZrsyqBnCoVHpjqZ8ATnIjlCvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEvyy9eeQf0Yk/Ieb2Rz3jYPA/LbL/k5t/Vi+9xhEPx82xW2wZ
 EZ/mJde9n6VHJIo6rtG7IN8mFfVGa8CsYyw9y5i00m/4UZUD53jCqjOxGNcPjkbpZDvp+c0Eqpk
 LLrSPzm5rXpXPbY8RWPLXY1Ks5bA4skJeMMLwJIA6oxwD5kn4uLgU3j8aqTy7TWnkOueo7nI=
X-Gm-Gg: AY/fxX5LGZby+2u73k1eac7HGC13bdERAJEpLLg3Y3eh6Q9oapzLmdgMTO3hPOyEQPI
 FLcKkmtEhJ4C4a9HRAe5IsLP17R+W0OYZxaCnYnbp4ifE6nTiRInUYFPK9ymkKl715PP8XuL/fr
 CEkVc8M5Ts7JXEAERHJEqX/r1d8b2vIJR+U9CjohsgeSEq+oaFhaHrzlrOPDaHSS+Y63nWngIg1
 bOo/r9UWcEQ6jJA3wV8R9vS5wTL0ny9xWLsAxD22U8Gif2bbO0JEg6TG0zilJ+WK/OYaTpQjJFA
 nZYJiGNXSTJCgSLlzJymJWtNKzrMHvMype/2g8DJfrV1B+8+xNBOvPahsDHYO0ZBY2dTgeMsLeO
 fkhTsnwkn0Pvp09vnuWlYl1BI36XS+i80FQslUcp/1B5xbhYakzO0iGHLQDccyrzizo8TH3mEy+
 vGI2Gti59407V+psGSFXfmvd4=
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id
 af79cd13be357-8c6a696323bmr1545281685a.90.1768821870220; 
 Mon, 19 Jan 2026 03:24:30 -0800 (PST)
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id
 af79cd13be357-8c6a696323bmr1545277285a.90.1768821869747; 
 Mon, 19 Jan 2026 03:24:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384fb9ab8sm32747931fa.48.2026.01.19.03.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 03:24:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Mon, 19 Jan 2026 13:24:27 +0200
Message-ID: <176882185857.86521.18172781461760523152.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lH3zc606193Idobk0yW9ulM2c94pbStF
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e1472 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dLs8YEEMlrLrhmPZdm0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lH3zc606193Idobk0yW9ulM2c94pbStF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX20M2NC1d5oiy
 hu/7D6Ov9+4p2GjRilIl0bfEkffaOcLj2tWU56Fdr+h9p1XtPWicKUOPDN1C13G4t/DXkyHVv9v
 C1YODWymJXrOza+OzXb8JKvA0AmUXVjVBzZy5oug/9MK/O57z8y9/QsAzE2tjEUwssY84qbF9gn
 jHjO9Hms2JVnMiqAprOGKQ/BR8euRcfqMslEQMS3wNy+q4naMOxSy7btWR5d66YfhTDPxw8ci15
 50kHIyeVo4Q2JUPIhMY2YZxO0wNz1WHPJdamkbqBkLX4DTOPnmcvkQRnDAW8O4ZXqfgYrFTpMJG
 aPoMONED0YcpjvzdjczQ2/iXWCT4ojSzx1itvRFRr4h24JX6xtqXyJ0UGxipLcdWuyhs/VlQd+k
 eh7JFEb0DBrUP/95jwQtZogcxoaNYA26JuyTAx4U6kFdwHSO/8goCBY9sH2TyajjuZHZdcry1u6
 sYuwGbqCi7ch0gHrWXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094
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

On Wed, 07 Jan 2026 20:14:57 +0200, Dmitry Baryshkov wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. Currently it's mostly ignored by the framework: it
> calls write_infoframe() / clear_infoframe() callbacks for all frames and
> expects them to return success even if the InfoFrame is not supported.
> 
> Sort that out, making sure that all interfaces are consistent:
> - split function interfaces, having a pair of callbacks per each
>   InfoFrame type.
> - write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
>   for unsupported InfoFrames.
> - don't create and enable unsupported InfoFrames.
> - limit debugfs to provide supported InfoFrames only.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: check the infoframes behaviour
        commit: 7436a87db99d57196c49d10de35f41531993d5f1
[02/10] drm/vc4: hdmi: implement clear_infoframe
        commit: 3a4ceb89a9723088615ea1c960fc589f87caddb7
[03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
        commit: 638409979c5f7d3155afcded67532003e07a7d0e
[04/10] drm/connector: make clear_infoframe callback mandatory for HDMI connectors
        commit: afc399f7a5ea7bf405b2ef85c7470529b1a9e47c
[05/10] drm/bridge: refactor HDMI InfoFrame callbacks
        commit: b626b1a1c9ccadd8861870a2a450f02e0c61ab88
[06/10] drm/display: hdmi_state_helper: split InfoFrame functions per type
        commit: e802c783be94bf71541a7e2ac8b1b5486aad10db
[07/10] drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
        commit: 1d8847f457648ed4932019dcd3081bc27bcea936
[08/10] drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
        commit: 4fc30c2c5c61db88e3d6644bd3dd2032ec4bee06
[09/10] drm/display: bridge_connector: dynamically generate HDMI callbacks
        commit: ae219fdc952c315182b471f5aa71b379584b70ca
[10/10] drm/debug: don't register files for unsupported HDMI InfoFrames
        commit: 5a4e4e30f6dc4d2a68eec08257128906572f3346

Best regards,
-- 
With best wishes
Dmitry

