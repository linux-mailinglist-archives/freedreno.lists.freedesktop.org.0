Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7A573844
	for <lists+freedreno@lfdr.de>; Wed, 13 Jul 2022 16:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F89ADF6;
	Wed, 13 Jul 2022 14:02:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF711A25B;
 Wed, 13 Jul 2022 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657693463; x=1689229463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l3O8bpPbmlCj5ClVjdMOYaBIcJZfMAtXaOax1aoCalM=;
 b=PxB6KoBBzAuGkcrzOSYOrcXFcDUlsP1lNxAKtMiW71PA5Z1vVp7nAdX4
 KvnvIJK7JhOxa3bWL+/Jmkl1a/XOZfrmuloJEk/drBboiRqOWesCsCyYt
 7LZmASaVptzN42ihCXlURfy8ar3+SPPSaAK9jsn6ms1PpU2EWo4C56ePF Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jul 2022 23:24:22 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 23:24:22 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 23:24:20 -0700
From: <quic_ddhamara@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Date: Wed, 13 Jul 2022 11:53:54 +0530
Message-ID: <20220713062355.6846-1-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Wed, 13 Jul 2022 14:02:08 +0000
Subject: [Freedreno] [PATCH 0/1] drm/msm/a6xx: Fix null pointer access in
 a6xx_get_indexed_registers
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
Cc: quic_akhilpo@quicinc.com, linux-arm-msm@vger.kernel.org,
 ddhamara <ddhamara@quicinc.com>, dri-devel@lists.freedesktop.org,
 robclark@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: ddhamara <ddhamara@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Akhil P Oommen (1):
  drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.37.0

