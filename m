Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF45347B42
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B7D6EA20;
	Wed, 24 Mar 2021 15:00:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9B6EA20
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b83so32435778lfd.11
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
 b=A6DZRaZ1ty5zT2tsq2EEmG7FYfPgiPI1yD48orj2sYeEunnaZ7My7QsOfr6BadnkfM
 xIzkJXosNHm6qtUS9jTnKI/8VKgRfv8qqNFDJGClJ6ZrKqhsnM/pUPuLSCpcHypNsYq0
 wf4j3574QjNCVMZ+ieGEgd3W5dc1lNmCDW3iq938TM/oNoECos14PllGZlEx6ZSMwPvt
 3/XPuCxY55Qyc1XaqhZOeqaC0F3oq5BeGk0pqQ86cfCJthl3r5+RbbEFp/JFA7Xl9u/Y
 pe1oZwnChyYZYHi2O95bJ8vXk3mh2ws8Szm0TDyT5SuXQeSQtNMQDF/7CHTqH4Xz8tY9
 9gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=weTz6m5LXcFdcbmDULQSn+jsUrGC4/6OEmDiA/doP4o=;
 b=MkiOnfZZA0Eb6KdjpCFSLJSBxa0nC8F4qtMNR+i3wmaz4QjxpN2BpynXx//9Fn75V9
 pDq7SiOFSYJRBrHZ6wyS4Z0Dr6rhqaG8AANWkP4rcHNQouLDBmzHxKYs27YveIR/Bgwf
 +eA1hcuSYVOIFDGkFaUOtoXqD0aGI75VOEBTEm9XL/m077eJGGgfuVs1Ud3IR7deHQJZ
 4oNykb39gG0Skecz8cQhfAV4tkHwyeN9+bxitOq6ZI+SlMUg5QSsFOuMBRiHLeKmF6Xq
 Xo8hU6fyPIfvT1EJz2ODeW5WCltKF3N/k1I1NwedkPdrl2jy2Yf57i8TpR9Rbh9ISwK9
 FeEA==
X-Gm-Message-State: AOAM530UUb4sDcRJBADx8GdlM4RS/mAextMHwWyvP06UDsTA8D9ZhEmj
 HtlMoh0Pywu8jLDfBTDV/CzjOg==
X-Google-Smtp-Source: ABdhPJywe7fz0NdqJIhVR+ybPgPme6B0QGjRA/oJ+ovNC/XP5+ZAIFQ2GaulTgOfpXcWvBGNImTVMw==
X-Received: by 2002:ac2:454d:: with SMTP id j13mr2259398lfm.129.1616598028459; 
 Wed, 24 Mar 2021 08:00:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:03 +0300
Message-Id: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 00/21] drm/msm/dpu: cleanup callbacks,
 resource manager
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

In the DPU driver each and every component would provide callbacks,
which are mostly static. Other components would use callbacks to receive
functionality instead of calling functions directly. Drop (most) of this
indirection, replacing with direct function calls. CTL and SSPP blocks
are left unconverted for now.

As we are at it, significant part of RM (resource manager) work is
dedicated to allocating statically linked components. Each LM is tied to
the single PP. Each MERGE_3D can be used by the specified pair of PPs.
Each DSPP is also tied to single LM. So instead of allocating them
through the RM, get them via static configuration.


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
