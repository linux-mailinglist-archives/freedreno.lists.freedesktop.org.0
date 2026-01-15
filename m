Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB5D289B7
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446D10E229;
	Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlbjJF0h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DAC10E229
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY7o02673401
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
 erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
 usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
 JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
 ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
 k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
 6E2Taw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm0p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52c67f65cso505692285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=YlbjJF0hDygUkW0QjjDZxAr3dsCfJsq7QtH4pWYx6dWIa8rhN6Q2ICAfAXWaALD9kn
 7CZPAKnmGs58vW2b3QHr14rD+wYitDaiQIWJIlE9k3hv/Fq4S9vSmPtBO3atv0zg1RjD
 xTySKhd7qNgxhke1Z09iyNoGRKeplTKzQyWNDYczHMftqaSYwKe5Pv2wqfh6xVjMsLeA
 h+2OKdlg3/DPOLQ+/XCPn0jWG9SDWh73k0WyigYNoUN1TUvxSOkDLny//VRNvuLcf0jc
 b/vtoyF5SIE9SFrGhPjebnylhlAzwS1q7N1wNb29LyMu/h2YHRk8yjccgEtuSHsGVtyR
 Ntvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511151; x=1769115951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
 b=i4mD2Jko2pC7GeloP9c7uzsiLIdQsdvMqPVPJzUkPplbWA0XYUp6TEcirMa1y7aDzc
 RTPN0AW8mOaznljH3/OptD9NoNcLTGw8rM8/wP9yTYNPtGzBH51tHwHH27kt/aP4H/Rw
 2z/ruMHZvxYH2vGglw515iJxeWRob7bRfYRShCBng1a4XdinJKGd4nCP3IiHgT4ohs/T
 Rl83EIPAx+DYeDcMPEE2MS+1ZpFPQ0rLg/2cdhNN6IpfEfw1kyDG2O7RCU1PHpqV+bIs
 3BnMoQmQr3k9cd7zpTOx4hhmVxv011kCuWGObmL88km93yK6M+O5UUjbHMKNwRLvrfOn
 AoAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0uMmxaF82l14/Ss4IPyW46G2v/QRy/Z7VQrkZMI3Z/yZDyvWz2XYlInNc7y4kLjiovDo9WhoXeLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPtF78pe+B/GGcQkDCr6p8BPM7UOUdo+RSTc1urZsS6y9Dy8F8
 1uVtbWacPyd7TZBkpkWjUKJ7k+2z6sTxi+WjCJ4gGjFEvgm8fEUu4++g+eZs0Q9kNxYxq8cAvQY
 doymkqiXW+lHaPr8vN0kP/RhXTr1+5QA8gXpUqim2/nFYbpeNNEbi3KQ9WARO6aDOdrUNdjg=
X-Gm-Gg: AY/fxX4zxD3YL6IGKOwoQpuAABQVUnRgOJ+i7xoP7+cPJjqmZkvpp7WIl2ZCu2/utWw
 u7RieIYCvgl4VZf9n6Y2ZbmNVaKcaPvWbF7JPPJsErqIebheRPXV1c7Tj4MNWwNVebUXeYD4J3B
 n6sQm2UscZj9Gp1Z7DLFuidLAS6f0zWkx8YMnEL1xk4KLfF5e/pVK8MtftafnYq/ASHcGl09i/8
 cttw67QVr31qUKrpCg9qObqHxADzvHwVWvLtXfc7NP93+PyM78rxcb1OrZMOlpX6sxFlzMr1tkY
 Fp5p3m2ELwfokaipkTFDYfAMDyph2OA4Kolp+YzNcXjPSSMVbTJsz8ZRRLRjsBqgnwmj+IpgeAj
 j+ztHrErfnFIjZ+e1fzni4ReCv4lnjS2N0558lYC1ncIhuM7ZQCnIy85zdy3d+Og73JObjghF1j
 hfVLt1GRxibgjyJKoE08OqzJE=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120082585a.8.1768511150955; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id
 af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340; 
 Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and
 friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX+dtQAphpWpuw
 u0hEaruihfYfBovOL+DRtHBLBVms/mPyi84kOdbYVxpkIxcaPe0tJ6HjbF7Gl9FvDlqCZLYk5m1
 4koGxddd6y80ADZ1BzoNwGxD5OIPdBPuCemF/8gKwdV8xhGeFNmF5kFnkLFnfcClBK2QLhyrChn
 59qirKTdSD424nWD2A3NEsJuBhlNTjm5x+P+pS2TsZKibZuZQ0spSSGwSVjFoEcXt8SBO+wivzT
 X1AdELe+Dq1UfjNNc1zSiZLGowrI1dBMUyDACmhoTN/TCKEQ/FvqWSB73jjBFVBpvb4L7F1oRQs
 0trj/Dp771pADzznng+CZYxQ8I542gU392nnlYiM69qQd1ugo2cUIUq2GMXdIXDKRS0iImmF/mr
 /lvbW9BSB/j73UD/0tW6+eeXsf5ghhuGCLoR/InQxAoe4NVUIXHGESrpO0E5kl191rLFWGcQhzP
 90pZwaGuTEKFjo/KA7Q==
X-Proofpoint-ORIG-GUID: lEK1GDqlSNl6m7PiInerHjcAH9DgjCWR
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: lEK1GDqlSNl6m7PiInerHjcAH9DgjCWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry


