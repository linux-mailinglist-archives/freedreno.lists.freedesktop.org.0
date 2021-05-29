Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AE39497D
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 02:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEDC6E994;
	Sat, 29 May 2021 00:25:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC986E994
 for <freedreno@lists.freedesktop.org>; Sat, 29 May 2021 00:25:17 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f12so7375245ljp.2
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
 b=uGbtAPxEvoyvx74MWS2o9kIhLaCxR9NZQ6OmOv9oc9hu1TLxHNNAPYn3gzlIIJmx3h
 XQgbiB6FlZeDbiJJbKaKLSedqzztcCnXFEcc95yl3p1abMg+6eJOXmw/L6h4R+IV9o6C
 XQesOeUmZMXHiEWXCfniwHipBZ8c/7VZhLxfplhdeg+Gi+VCzAEeSV70U2Whz/KT/gff
 aP+9LDkHVzzE7Ssm6TA3El5AQEnaKCe0sgboENoAm609RhU7dziYGl8A8KtOC88joMS1
 7iUtAC0eLTUnqx0D7SRsf+FnZbjq25dNJ4X4UWLyV/5j5iaNw7aaITt6uCukQEazBtei
 OTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
 b=Pcba2v73alDhNl4XD6au25/e1X6llb0EPRsc4+1UUG0on+xr+YsvzWNna3GmaUFxBb
 9z6nM/VcOEZGqGLXXjhCFfwmo2Pue50O8/MXClTFtXKT81IKCwtnbue7DO2ctjUUQgR8
 X7sS8WoEMnLM3GMSarBIs7hrkAQiI3/a1uWR9wNdVtep1kS0I/cKUefyBI2xEshAZyu5
 0InGinGJnvh3QSgfu8rp8xJuQ4+IA+9NKQzU9HyTxCz0MyKvJp1sSDScDdKCDUVuPRQv
 EQOEm8qlNZ7LB8PbFCz3Vdd2GGmf/le/e/JptSoAMJTvfGQ3iPkroCTS345mPJlIPu/m
 Nghw==
X-Gm-Message-State: AOAM531s8WZj8rpyDA2Rcv7rl0G1Abu1SWyRMXmr8kyQ2fguG8mjc5HZ
 BIB+QJt1mxaUpR8zeZGgbgq1kg==
X-Google-Smtp-Source: ABdhPJwjvewfZRMsnIYRlASELtzoZFUlolzG/MKKgogWsG4jMl6ZWBKnxfp4ESok53GK3bD6sdVxMA==
X-Received: by 2002:a2e:7a17:: with SMTP id v23mr8274083ljc.99.1622247915928; 
 Fri, 28 May 2021 17:25:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Sat, 29 May 2021 03:25:00 +0300
Message-Id: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [RFC 0/8] drm/msm: split DSI PHY to generic PHY
 subsystem
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patchseries is an RFC for splitting Qualcomm DSI PHY from drm/msm
driver to generic PHY subsystem.

Dependencies:
 - msm_disp_snapshot fix at https://lore.kernel.org/linux-arm-msm/20210527220330.3364716-1-dmitry.baryshkov@linaro.org/
 - Patches 1-7 from https://lore.kernel.org/linux-arm-msm/20210515131217.1540412-1-dmitry.baryshkov@linaro.org/

PATCH 8 from this series is quite big, it might be split further if
required.


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
