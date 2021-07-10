Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8FF3C3707
	for <lists+freedreno@lfdr.de>; Sun, 11 Jul 2021 00:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074F26EB66;
	Sat, 10 Jul 2021 22:20:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EC76EB60
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u25so15206480ljj.11
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
 b=cOc6Ro8+IZ9NK2jzMEfXuL0RvCQr+YtBZrXCJRrlOd8yeuhqAvDjMeBZmNtIUL94FS
 ZHgu3E93HjkeB2ixitQxYNOm4WskyFPX6cb0FnYAmuqW0AaVwvHhUcwTatbD4I87GYq2
 8S4StzXwPNPqxF+pKYnZayK2zkr49ydEeABBtw6kGYH795lK5o6bdNIVpbYdLXmVM5cm
 ZrXjEDF0wu0gwK+8JJfigTWbLY4MBtJvZ/wc6JqBB3tD+oE7nCmJmzijk6geLZf4QoRk
 0g/oCL9G04b6LQCz81yuO6QcJCkcvFhGiAVHEKqSebVKO0HElq1SdmAPJAI3RXrz0G3a
 lksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
 b=FpAs6ejI3OEhvL/JHMijLd/EbwPGz1zBUGjmtIMKGfCif40g9e361sdGnnJQ7TezQX
 oseLtBAcVYsv91HisA2mDD7Z9qTC5oxZnQExbcHrKapov4jo9I80LPVQ6oxjN+D2FRDu
 of7jMhbvo5uDw+s1ny2hihS5FNCEYyM2lvGpkp/USiRrY28wPMPws1a3xbWz5mDuPcBZ
 OYRzY1u2CPHXExvDbYSDAvYhOqN4turY3WBli2yxLGgywnPo5CdvXqEwni42RDCDn2OH
 xpWNbHUDbgAMiMwqyP5N0MBjm/j8l2JCV+m59TSChTBlPwzq4NZhpQUa0SmLyXvWaPvA
 vcFg==
X-Gm-Message-State: AOAM533QixGWEUtgoVEOpgsK5x9ekTBYtn/cFjiiW3Jj/cYNtLX7JfHF
 qasmwTzTx66hNoWR5pzrJ72JDw==
X-Google-Smtp-Source: ABdhPJxkyQKAg3ovIJyXsN8xCqX0lw2DojpWbEvMFfSg4GrCOLycySMYHMREuR7o5+RP0Mtrovqy5Q==
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr18914747ljn.14.1625955608208; 
 Sat, 10 Jul 2021 15:20:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 11 Jul 2021 01:19:58 +0300
Message-Id: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/7] drm/msm/dpu: add support for independent
 DSI config
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

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Changes since v2:
 - Removed Reviewed-By tags from changed patches (1, 2)
 - Changed more dual DSI mentions in the patch 1
 - Added msm_dsi_is_master_dsi() helper
 - Rewrote dsi encoder setup function again basing on review by Abhinav

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
