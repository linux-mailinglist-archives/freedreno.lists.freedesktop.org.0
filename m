Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB69631C66
	for <lists+freedreno@lfdr.de>; Mon, 21 Nov 2022 10:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E65F10E180;
	Mon, 21 Nov 2022 09:08:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4710E174;
 Mon, 21 Nov 2022 09:08:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL8QEW8008997; Mon, 21 Nov 2022 09:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=dN/1OORLXDrlZjcUzz/iXvTANCZiAd8xkDrk+zHW4pA=;
 b=AgcEVlua7hAsgrsGAq4gQFJW+Qf/YK/gP8yxKe3zYWZQHRQgkz58OPpF9qILR8MUTp7w
 fsU1ZbUqk4ShFdgOfhi4e2hLZdYp7R3nPI3H04KOPTEVTJ9Fdx8o1CI0XQ3NllYVniy4
 SojZmso1+neKXI4eqI44SUk+3oLUIpvJRuzxDubahEh582M30vtFz82bk49SPW2vYBf+
 R48dbUapzCBqjxq3QY3uQ5TqhVgKUaIlFjTw5rck8qn8PB62W+7OJ0dwNgVEVplHSNkk
 sU1VvXuseqTCi00sG+j3WaUBK6uVteWAP/gvlMoQmTeAErw5o1cJGWGZ5DpLEWrk38bv Tg== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxraubyp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 09:08:23 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AL98JbC032742; 
 Mon, 21 Nov 2022 09:08:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3kxr7k3t7q-1;
 Mon, 21 Nov 2022 09:08:19 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AL98JXD032737;
 Mon, 21 Nov 2022 09:08:19 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AL98J3u032736;
 Mon, 21 Nov 2022 09:08:19 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 4939A349C; Mon, 21 Nov 2022 01:08:18 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 01:08:12 -0800
Message-Id: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m01uVsgwOT6c2IUr64XUT93OOfpZtC0h
X-Proofpoint-ORIG-GUID: m01uVsgwOT6c2IUr64XUT93OOfpZtC0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_05,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=563 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210071
Subject: [Freedreno] [PATCH v4 0/3] add color management support for the crtc
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add color management support for the crtc provided there are
enough dspps that can be allocated from the catalog

Kalyan Thota (3):
  drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
  drm/msm/disp/dpu1: add helper to know if display is builtin
  drm/msm/disp/dpu1: add color management support for the crtc

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 33 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 24 ++++++++++++++-------
 5 files changed, 60 insertions(+), 13 deletions(-)

-- 
2.7.4

