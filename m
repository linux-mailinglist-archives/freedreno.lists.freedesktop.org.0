Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0D73169F
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E6F10E4CF;
	Thu, 15 Jun 2023 11:31:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD8B10E4CF
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:34 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b344476313so25995841fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828692; x=1689420692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70uYOl22od6voBT++PO0PloxqsuILnAv+rJj4oS0Q5U=;
 b=JLeyIJZxnpVHC3jQwlds4ko3NwjIUHoLiSFmDPH9ZXv0XPS6TQ717WiJlKIY0ymaDv
 gTV2pR0kfwphmwKiPsSgwodV7AcsW2CInL712psWsqWfvF/fD4FgR3t7mBUIntqDgoZd
 bnY6NA/AvyNZ6lmkyZhVnpmHcCJSfZIAM71On2h+KYCyqilFGx4/dil3oq+tv9HNIynE
 4efo5Tl5+Pg12RNUw8ztzxHaYItnuD8pO3srvL0YoiflNO6RMUA72osBEDDxmlY6sVnd
 qc3uNxJBLY7OkiYtZQtMhQ7M5wy/7mnrBRzYxPTW4+YrdXhqVCBX2YvZbI9jttdpN/nx
 TVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828692; x=1689420692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70uYOl22od6voBT++PO0PloxqsuILnAv+rJj4oS0Q5U=;
 b=iijDZlGUyk0J1cgBw0KWlNsB9iftB3Gzk9dtdk9jPfc2PbuGJGsvlaJlEH0oGs41qk
 BuDRkfVXDDU5uwvV1Ww6ELOJ3RbBo0uJhqkJmijm/3WENBLUgnsacFlqof14FV+yUEEZ
 +W6lLtncCGO8NPdW8beCziKCSPbJASPtxgQ5YSt/PKILqU6aqO2997Qzx7aRg5E0v1/O
 sQXRrCzSES6JMEZB5CvDwClxSG/Y+pS+NxPBp1EKCgpZI0oJxgWofYxeq1cRfUua5Tgj
 yL2D5r1NKgqJ7mLvrtat0pSltMF4xveVtd/fUq4vLctoHzQv6di7uMF4hq+iNpk+s97M
 cDLA==
X-Gm-Message-State: AC+VfDwS0xKXJGLUEhn5y5vmMZzrXMEx/Vlfjkpdsmg/xJKnk7ATh8pT
 KDStZYvmHXjFMYsMDXtx5tpjpw==
X-Google-Smtp-Source: ACHHUZ5Li3AXk78OUM4vR7rskyjT/kylPI5nBf3KDCjoapmUh5UQ5ppn5e5dUqqp32J7YHO0DEY3cg==
X-Received: by 2002:a2e:9582:0:b0:2b1:c7f7:188d with SMTP id
 w2-20020a2e9582000000b002b1c7f7188dmr8807832ljh.23.1686828692640; 
 Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Jun 2023 14:31:22 +0300
Message-Id: <168682860384.384026.9850510984858511761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 00/22]drm/msm/dpu: another catalog rework
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 13 Jun 2023 03:09:39 +0300, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> [...]

Applied, thanks!

[01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5efc0fec31d8
[02/22] drm/msm/dpu: correct MERGE_3D length
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f01fb5e211fd
[03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
        https://gitlab.freedesktop.org/lumag/msm/-/commit/17bf6f8efc50

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
