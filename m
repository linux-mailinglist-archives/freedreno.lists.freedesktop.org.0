Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70081D3A6B4
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 12:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF5610E3F9;
	Mon, 19 Jan 2026 11:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK9FqWXf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx5aTybP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1F10E3FA
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J90mNn1904978
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
 3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
 A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
 PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
 lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
 iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
 hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8q7p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a2ef071dso1260440085a.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768821830; x=1769426630;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
 b=Cx5aTybPHKYWe6RpSKqr6+uoIIq2cbk1gGQcEFKv74M07/kPNFGyWyp4XFz+MSp/Gd
 VeiPh5gBL02nm5DNe9dxQUDcgvG1F2BxOPWptuyKECn6IzEdUk0PX86SdDr4tjO7TFL1
 TM3gya1JWmUWQyStitZAMS/GYHPteFXAVy2GldB6Q4sLyR/eNSaj2Olcr+nXzVIIwh97
 InuZwvaLeJFIk/cAnOeDId4ogKCtU2FVjgLc2DFTI0fVUnmNkAMv70BFjDAViC1bqDAO
 O9QsYABafpf1NrDSk4/k1AF/359VoxNnOAJ8YiN8yZWjbGlJ9rBERzqp7hq9zmO+kUQh
 U4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768821830; x=1769426630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
 b=XFg7Wy4MI+bzMCLcCSApD11pPRp3JG7PI6a5YfLZpAEfTxxqVR5NN8F/qymhJFNnKj
 38WRhBFpOXZgC3jGUfzBjiqQF0LL0zvnf0LdB6Zc11COY0pVWyzYXSz49u2Qu80tghOg
 vBCv2b3X6mOHPo78SvJ5TCaNAoCfdERHaPOWzuK51ahUGfcYYpan+YveN5ibaIKygOgH
 OoPFRIXAKnx9dhroHD36rNxUNZepCqsZaLbRUZ+BhQnrxoz5FAEp3jtTmdbWjBilA1F5
 dJWeq24oL1uUMk5svYCBx8XPxyt1jv+oOLUUuhACIYz71csfTTQds0yEqPYOZIud3yUP
 Gbnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfXbtiy50nJDjEESnQALvUNuVRqG85BcQVGvht/ywDPR1YURqOT3cJP26Td5nx6SHJhbFDaWyz0ac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjyHvl7Wxtv1FlDaDv3a27QmTYps6g03CYvFF90nBD62mMEgVb
 R9xAkpBLs/iw+n9pKvVhMEiBXd9M2Hu8p12iiajaBhd2U+s6lAgQ8UsuH5BUP1GtIrY4n5x+vMJ
 vCPGF6Evc4W7pXbZo18CkOiof/uQo5iK7itDACuKOmQ6PUyoE1F/ALEKlMwoTDaSBU9wIGV0=
X-Gm-Gg: AY/fxX7TU3tmpha4Ay/SvSXpEeQwE8Yr2Ukg0LEa/txsAaFofsW5HmekZv20leutF/B
 RpNIhIZUbTaD/hZbqrUyk015PXaVi4R/2xyCFEe3q8/TVGldklbx+ypcMjoOuRH1ixiWCVrDIki
 GUBpaxOSKz/kL+merQc957rFheFx0gKfnvm5uW5TzbP9s6Dzsg6OvO/gZ5MZ3SP02mtDhNuWO53
 6qN0IOkkTEGr9gvNyOQsqmOhYAzCvXHFqQYmlaVHLmw+a9hhvRiTBGhZw0ZrFOgjeMZVtKDHpou
 B7uiZdH2TsYbti0zNxY18iUlMPfdf4poWf/BRqMNy28wMvM6mphUbvW1oJGzx7P68kXA3MpprCQ
 Ct4AjtDPsy0vjwLf0AunZQGU81F/NuuL7YsDoJDMvsogcAdtlJzCEICFMoVVFMGBbFgpnQFLXYm
 apcYVkkpNhAvcrL5u1nU8Knf0=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id
 af79cd13be357-8c6af595e6amr1169565885a.18.1768821828910; 
 Mon, 19 Jan 2026 03:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id
 af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488; 
 Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX17m/RdRpDKP0
 3ekpiSfLQZG/Avl3qaWh0za5T7ZjCRzjny7XeoHljnp62HxYInucyK4+N719ObIw2/PjV8T2bPi
 3gQHzbQoLYink6SsNC8KW3Fp9zA6w7/ey9aB88w6wHor3lNX07rMIyiQE90NCGCSo9E1D+KT3AX
 4GSFRrt1J8S1PFEQtj07SxEYizY7/Knf3FchVWl3dGbbGqcUSvNcPFcEPmZ4vFpEEM4EShhDGxx
 30S2/7hofs0bc9LMyDOZ2Gxo4cjs9ERj5pYTX8Od3bbpOK/BXNN35mhrFxT0pIA53fEzAx6SKQi
 fWRBZ1WA3fGc2sNQ4JxDYlAQVBX5nsPyxcTe4oPBZi9KuhAqD7lmKJZ2IhCM8b++9c6JHM6glCA
 B0RLuodYDAKl1Vm2fDeoQSeGfyOgt0ap8XnpiYuMQYu0ZLTSKrUQ7Dz1QrPiA7MpCqmuUhXog5O
 v8bn12fjow5o4HRBSdA==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e1446 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fOLyCAqNbC2FW-h6SskHRBwHqdYoAv9-
X-Proofpoint-GUID: fOLyCAqNbC2FW-h6SskHRBwHqdYoAv9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
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

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry
