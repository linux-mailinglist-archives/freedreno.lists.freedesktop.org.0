Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019ED66359B
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F9D10E513;
	Mon,  9 Jan 2023 23:44:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4871E10E47E
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so15614692lfv.7
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=ei8MTQp7vxUDhE4iKnFq1/ntIVOdVd6tuXdIpOwfrtvx6atVRVyyPKbWmpP1rvFscm
 L/HdGhjbrE+c7TQb0HLPWkDmPusmKnPG+9MOnxpN3/Kf7+ZcxOf74CrMNZKh4weg2gn0
 VAa2vJLjrJdKTjoZlopffsHF0cON4Oosur23OYVwDAeP7QV/D66IEuheo8TXkNSBuSiE
 t4YdtaaGJMd7+GqNvB+m3/veyYEY64bKKMEoZMJ3L5/uN5rWfRg1YOdEMCW7OruZol2/
 PzAjdWAqIKpW2myPiH8sn1TYfz6YIweA2qsyX9r1VZODVzIvPbIuiP31Ckl4nw1fgCr2
 cXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=0v/AF7qIgBXmrxfXgYgHjryKY/jvaM1tR8P+MnOZS6psstZB1+PtKjQqvxf1kLeO46
 37+yGxJppqVlPylHJsFlYEdfhSWp3PNyDwGKP2KLRtX3G+EH/oF+QPmTsT4nL0bbkoUQ
 OWkhPgpV2qLudo/hI+4XrR0lzZ0LKVRmEnHVGU7IiJp5RCblIiz4kstBOjkIhJSmFCLz
 auRbyiLmk4+er3zYJBvdqBSOmgAXA8+iApVsyst2UbviXiPAaFBCqG6BfC1DcNLYZgdg
 gNxmE3Xvl6iZP5xrXKl8hu7x5a1IKIRzOAlruJt74z4i+xLgGfG5QiXyAGqxe2ZWpJ+n
 N9Yg==
X-Gm-Message-State: AFqh2kq+ru7RukyhSQ9NjLnSOz+ecOjqdmq4mtzzgxRsYGy6TBruUI4e
 +p4oPW5SYfazY+oawtjkb8udDA==
X-Google-Smtp-Source: AMrXdXvTqLgwZKbMxDEd7mTBv9Kz2IZ//DCx8MFrgLL57L7EaiB/j8/l1Pzsuay0XCa3nvGoVipSxg==
X-Received: by 2002:ac2:5231:0:b0:4a6:c596:6ff7 with SMTP id
 i17-20020ac25231000000b004a6c5966ff7mr16944972lfl.2.1673307843575; 
 Mon, 09 Jan 2023 15:44:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Jan 2023 01:43:47 +0200
Message-Id: <167330408779.609993.9427004517463466813.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v6 0/4] drm/msm: convet to
 drm_crtc_handle_vblank()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 18 Jun 2022 02:33:24 +0300, Dmitry Baryshkov wrote:
> This patchseries replaces drm_handle_vblank() with
> drm_crtc_handle_vblank(). As a bonus result of this conversion it is
> possible to drop the stored array of allocated CRTCs and use the core
> CRTC iterators.
> 
> Changes since v5:
>  - Clean up the event_thread->worker in case of an error to fix possible
>    oops in msm_drm_uninit().
> 
> [...]

Applied, thanks!

[1/4] drm/msm: clean event_thread->worker in case of an error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c79bb6b92def
[2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6606a96ab1ce
[3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e96c08e91726

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
