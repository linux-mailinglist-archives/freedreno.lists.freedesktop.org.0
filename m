Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6235B79B
	for <lists+freedreno@lfdr.de>; Mon, 12 Apr 2021 02:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2A89FC3;
	Mon, 12 Apr 2021 00:10:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4489F4F
 for <freedreno@lists.freedesktop.org>; Mon, 12 Apr 2021 00:09:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id e14so5781125lfn.11
 for <freedreno@lists.freedesktop.org>; Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
 b=OmvDZii4vmb8/0sBD0CQQgLdaycbFPDwbuVJZBq8ACYRKsOn2rsvZXw7kT/7GOFCL+
 USb7IO6es5ortDKX2IC4NXxIMo55eFrPgkYsZ3s4hbXhnU05v5HFruUC2/WONkiBmgEA
 Q97ctTW6Hs6dGtJ16jGNq23ChfGFEeTdRPP3RoR9RGfzlHcYaVanPriZNJ1KaRvR92wa
 plQPmjw0wlj5ZfAonnLQqoqV+VoPgS6fayZ2epVmbaBHPwobgkMvk2TiZtgXIukKkh8P
 ktwKbB3DU1D9Y3jWVeu0bK/NlNrzIp72xDDHj6wScVkW7K/4yn0tj6kpuWhQx6b5+fMn
 7LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
 b=k0etpjS+9bii2XXfX2GvNgvIhN7hYUzGfTBHnsqNHw8lZGomRSW6jvTr90l56Cfqxp
 /kqfoU/GKxRMxlTXGHJjKmKdd85lr6Bj3lzXycFE+lhk6ZWtyv954CdHZcBkObBa6L1M
 Wcw1+LSDXZJoWXbdX2p4SVtKOOGy4HisZSWMIGSGyh6OBK1ct4Pn39+KUXGJpowub03y
 3eyz9k3i4s3F97df/9y1/w6qshpCBfSkdE32Yn4t1hM7qMOWxlldPztoPcXpZIzU1cDk
 FxQGNqI4EK37MyBYxK4C25dXyHU7pZgv9iuuXFZsdVvUy6moa8aD1EmkyNzAHK+8bItm
 mWyQ==
X-Gm-Message-State: AOAM533knlTkCZJCqB28MVIE4CnntKqLXkcKF8n2pqWp+6aZzag9j0d+
 aA9eleFpvj2AJGriE4ThBHh+ubdzcdv7lQ==
X-Google-Smtp-Source: ABdhPJw64o0fsIyMT6VMVTXR1CJsgkeTVjv86+/qNb+VMX3cHR/nBKnLZ54ICd7ERmwyotwdOcQWhw==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr17758694lfm.25.1618186197646; 
 Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s22sm2307212ljd.28.2021.04.11.17.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Mon, 12 Apr 2021 03:09:51 +0300
Message-Id: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 0/3] drm/msm/dpu: rework irq handling
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Simplify IRQ handling. dpu_irq_map is a huge table consisting of all
possible IRQ entries (including a plenty of 'reserved' = not existing
IRQs). It is always used to lookup the interrupt index (in the table)
and then to use this index to lookup related interrupt register and
mask. For the long period of time these indices had 1:1 correspondence
to register/mask pairs. SC7280 introduced 'additional' IRQs removing
this correpondence.

Replace all IRQ lookup with stable irq indices, which correponds
directly to the register/bit pair. The dpu_irq_map table is used only
for the lookup of the irq index.

Changes since RFC:
 - rebase on top of msm/msm-next to include SC7280 changes.


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
