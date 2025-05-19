Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F409CABBBA6
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE3910E3E3;
	Mon, 19 May 2025 10:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjF/tVJV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D3C10E3C7
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9io8g005266
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=NjF/tVJVpJp9dnFn
 yL97Jgn2iUw0DjUTbHctm9R+QtGTwvfaFe88tvwg80d+A9CDrCNtQyDuRzC+lMs+
 KHvSdl7O9WApTPpzDiP1Pb8qXvc8OEh5PDpMj4al3sSsMXeKyOGJe2l6CaBtR75t
 GxJuuFCOreqNhlM/DAWIn7sTfncYev5bL0rr78iYBf9W7os0Z3u16f6FWVviStwm
 gKyRpWKw5XbAigpZCWADerZ7qZzf7s+9i7Sxls8yhwY5+YtddipxDvf1J7lxEu+M
 YI4626r0kYCln6/pHHH73sLlXwFLe++XUUHQ3/FvKdYG8hB+M3qyVvgVgOcGvTvb
 BrhoZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4v497-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f2b50a75d8so65914896d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652336; x=1748257136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
 b=sSOKcXkH8rTrC24QvGp/nWz7NgHSkLGkkOYBxWWg0WoegYaIsUhjN6oahINxjxoJea
 2HZT2/bS3LjD10dgKy1Lm5bFUuxxMJD20iYz8PbNKEGH2qibvl9URYggNFmruSRZXh6+
 UHZ9coxe8v0RV68lIF4+urHfXe0ZsTZkwEz7SyDdUZ3uyl/FFoKxUHTxyHp/Dr3jPXvl
 WXUgNa1LfEUUXoJk4/1IocsduUX7ZVJiq0XdRKCGmp/fSgaoF18TrDQvp3JvEOrnjdkx
 jF2MGSWCg3JFhE8LSgE57so4W+qsi1HY4i8SUWhwC1T2Ikdzm+h3CP/spYLECXDMFuqQ
 s4qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9pHqKc2p30RLlL8W2UAJfJTgG7abL3rhDvlXcTRZO6FpelGo+XbA3SMY5nG/zF/ZNV6zV0sOZ+so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0i9ZFtmuQf7dXSQAK6rGF04fgWbd+aLQaKZalSePDqnjtE0Vb
 5Tsj+O5fIul30FvhS+rwMsiQBStgEscwM6JkiyvTPeC8XvaxcaJFaH7UYMYjWoBuK+pHIgC41Hh
 4IYfKrG13nrR5onydoRPucs0myTQGohL+MMf3FMAAfnnoktQC5YNuvGn4AJSSbw4jk6/EIoU=
X-Gm-Gg: ASbGncuzNsHYSOM5VLp8yc9ohmhhZSedM9RMGSZ39KUxC8ziWt0QOuilmnrLJ1XODix
 4g2yLCbNZKEahATkuGr4SyZEKXOK9HM0brU/hmb3DEwrUGwidjXeYglHJuFga113Wo6K87dDiBK
 BgUu3vKryFFpPwBY3WDwWs504BevSFBXviRsaOGPi3GpSskXC3J9h1aKRLQSMqKc06rSwm35ZAk
 I7FHZfA4LXHYwngUssevZ9jwMtRhCXCWQ5yfSIaH2zueFHxp3QVHRznIEWnCQTkcB2qJ6WgfG1w
 f5z2loFaJdjjK4GjeRALQBI+9gEmsHYUhAk7L6cpmHLobvEr0kMZ7DSnUA44NEX9JPI3A4HNSv6
 jWYZtZjU/mR+J6U5zHcaOWAPt
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id
 6a1803df08f44-6f8b2d43634mr196493776d6.25.1747652335797; 
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh0901HTX646XfSkqw0SlUlwGL7S94w7htNY7rCEBwseDBwVnIRM7EgU1CqdTteJyLVHdqrw==
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id
 6a1803df08f44-6f8b2d43634mr196493266d6.25.1747652335324; 
 Mon, 19 May 2025 03:58:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Mon, 19 May 2025 13:58:38 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b0ef1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: NzfrGisLXroz-admYT40W92GU0AggvXk
X-Proofpoint-GUID: NzfrGisLXroz-admYT40W92GU0AggvXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXyhmP1AWujJ5Q
 KNtf7wnOIVIpRAfDssxso9j+LRoMkT5i9xUDccq0bp5O+Gw6zN7xnl/TAPbH/OKa41buC9ONN/I
 F+gyMtXb17R6Muv6dE63K0hBgZFvWLhpTQr9/TEtejnd4gbg3/Uo3c4EhjXixnzwHw9gyHURFvn
 2foSLaX4MulJ/Gx6ksBwhhXYxQkD0BfdczhE16lWW6KuBOhbHyzpRNhO+s9CyQK+qh3x0n9qHMN
 1XYbrz6xJ39tfik9dtLfvXL49n4vPoT/D5EzDiwDJGZULZH5yVLQqKWlkb7cBPlhaeHESWYa2c5
 ZF6U4LwEgJMxgpvdZw0HJpg/SmumvT9M/DEGEds6wKHVNDiEDln6gYefcOLy3OC2KzqiEMxSMx3
 FIF4oEdGCZzRIWskTWjJCcOuQ1XsSKTkYMhP6fxboRu83UJL8nqR86PvEC2IKePpPPuZbr6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=854 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
