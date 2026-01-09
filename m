Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02662D0AF4F
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 16:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434C10E26D;
	Fri,  9 Jan 2026 15:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/GZLk1J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLTKm/Kn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E4710E26D
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 15:37:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098aFp63629109
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 15:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeu
 Ee1C4toM=; b=l/GZLk1JvMRvn8d7JS4mmfK7QER4BQ0BVbx+q91Qp2g2WMt9LEk
 kF4WdMa9W/PDgFofIvDQCFJ6PR1EfY3MiOIhSraxLTD3vDenMcR3TQzmDEUzCwg7
 dqeEXwJxE2d1FJxRNfgytfYgOgWmW4oXhFdg2/iJ+H3TI6ahGFD+wBlNfuLge6ll
 Ctg3PG2mdIGFDP/5fnUCIxKSfZxAPJDKKk/2w7JFweXhWVQBlCo2ZKCqfW6oRr/1
 UaBTPYawZeYWJioGJb5huvqY2foIo8xL3t1/g6Y2mxfly0SV7ZT46jKjjgO4ozIo
 i9CkjSiJZYp1PUghK4mwlB1KVDQWwhiV8sg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j350p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 15:37:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c56848e6f45so397743a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767973054; x=1768577854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
 b=HLTKm/KnYrcmJDgRQDbJhA07CCvzu6BIyWbIiX2VkY5CQOQ0s8298XLX235AWprTFM
 yDiER6HZoT2yzDj9rsPdRDe/77/q44LRdge5KoSCcpzGsoi7Z7kvlnYyIplo2gJDkzHz
 LYsakMeK+LQTS8ml0t2Nh2nheP7ZChStBaBW1RTeGU9LPU1y8tUkrQNy9Cph1zoD2Lde
 f6+mAIwm2rw3rfLmyz4EXT9ytZOSafWE0kFgEJdTKftwhHIzUvBWVtDzOA/YZxVU/0g2
 GBQ/79CKDLvUJ3c4lnyeqJxzj1jrDnE0pi4DaHQk5yIqy//pkw2+SnFeO8t0X3uHkoCs
 9mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973054; x=1768577854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
 b=AC+mru1F45GD+WFM/DQZGwMLxwyW8my0ySrf974ftLC/GDtkPY1X8DKDluuNCMnmco
 fm1FwvwUiENCWqVyAxa1gS9BQ9p0304ee1mVREA28pHfXgwbfxbMIstwrtT25HWVPLaf
 SF8Kl/lSWYhMS5l8Zs4vHudBcW4L5WZK3KQwcHVRB/wii0seTWgT5jdw+3OOAjltdgZb
 D9ZUezJ/S3y6EcL9vihTSPSv8P1gPEIAxNmd8LvWsGMBg+n2QuxGcDZuFVdej810AJ7b
 t5fzDPBKd0wRzVo2XKcHDLkrdbildmxflRi0rfkG1TSh0lButdmhYd//Qmqjn8fx8aSu
 nP/Q==
X-Gm-Message-State: AOJu0YyRYD3mU5ElWI4jOc00dLLEt8ixgr+ItKuhUpCJZKE3iBcFSk3a
 oPBq6om/PC1EvelS/nxt1QgUMxodz5S9iOH2+onQTsUBUwpBE51nd51XHhxxPPfVgVB7hwLrKSL
 jzbHZUD89TzwILPVSL+NNpaXqlg8dtfTy6KFRlM72frNQ9ckVdz1jdwchQ2nLB0nF9VCrrbs=
X-Gm-Gg: AY/fxX4w85tYLtAWdRuxBEDiVg9Sn1cSrwmVb6LNkqFVlxRVNjilSAyU09P2XMw5E3S
 jpCqtfMIy/yu046aoxHEMXbO3+4vsDgZl+HQqCcKT5EK/cgpcz0FoK3cFgvix8qsliNx8+cXouQ
 HShOihy3NDAiLBwInnIXxahHoDfFyDG4L0Q4Yav/aVuBtMfNlye5m6LrelammMWLTCP9GOWjzaB
 MyOqX/mbQ0aC2dQIBjZfQ1+SG1ByOcM9Q/CIfhZDAHbUM1vIPJ28FEDftSDnLdMyhTJ+6mZaKEk
 +Vh0VUBouqXJlnYcNDgIPNnBEwX5ysdlvQmtMzp0jke5qM+oWqy3MsjJIoi9gLdd+PPGmVUrQlM
 d3/cFuYcSXn5PKz050u5StwMdtZ0LX4d5yZSbr1NNHj8j+KM0sCHgV9wo
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2a3ee4a8731mr91840775ad.53.1767973054428; 
 Fri, 09 Jan 2026 07:37:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Uk7qOMBA7antJfrGZImiAYyjpfRAhu2WhMQR4Frujasbn70BkFuYzCCn8ka6umjSyUS/Nw==
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2a3ee4a8731mr91840515ad.53.1767973053899; 
 Fri, 09 Jan 2026 07:37:33 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2a3sm110759525ad.13.2026.01.09.07.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:37:33 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: A couple gen8 fixes
Date: Fri,  9 Jan 2026 07:37:27 -0800
Message-ID: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX2tJ80F4VwWaO
 ehD1lhponp4Dh9Djo02ooqi2ikanSn+BaYf0VEbhMw6YWiw8zQwr+dql6ZTDZKFTc+v3mk57zLj
 S+6whTDIepJX0JU/2bKhq7GObEuq6T3UI9WVlrvGX4D+fEX/zPnk4IcbNFNVIPnyC3jzj1R34Ld
 5OJvuU6jYgh2E57bRv81J654MHzwuT7Zcb36jYm4EMkJOIQ6ygZZNmCmqWOoG51VkWgE5J+/Wjk
 vN/ccGQ8WrsOa+0f71lI2WeIyG+LYAxz1Rpv5ojMoJaPmla0+sdFwntxS0PA4oQAx962kRy63qS
 ik/MKdzYvozJf67+5+gbQ7XMbaf50o0RJIdIES4vLez02H3WIB+06bnHaImqeGfCPf2llihy5e+
 5wtAcHynFnI55fd/EJow+maGZT6oWyUf6BHyv8BTZddkTQAN70IUQvoSHrYgNarqr0oHleWyNCe
 +5Gksl8wn/pKZc6gLug==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696120bf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ho2Lwv9vkAcMQfqMMXEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 4YzyPIknu42Cxr9SA8Yyo0fI5Q2Nb5VU
X-Proofpoint-ORIG-GUID: 4YzyPIknu42Cxr9SA8Yyo0fI5Q2Nb5VU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090117
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

Fixes for a couple things I noticed in testing.

Rob Clark (2):
  drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
  drm/msm: Fix GMEM_BASE for gen8

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.52.0

