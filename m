Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830696A010F
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 03:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4488710E207;
	Thu, 23 Feb 2023 02:10:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5A110E49C
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 02:10:14 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536c02c9dfbso152053897b3.11
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 18:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
 b=NLiX6/4oMH+SP7OZC5H5dkuhYcqk9qtytdK8dpBWBW4NG9sbrJ8niFrUx5cx8SpArt
 2Gf8P6Z+SoOtRcI2MnO0WOv8wdbjFTrl+0HFTP1Gj5+oq7tUncVG6Gr4Iy+Z78IXGg/e
 mQw+Hg22nU2XYHZKBl2yo33jUAg9d1aVpCv8mwpSAB5+NPqOIqzW8/dg0OJNKMtdcsQQ
 gw+Xig4Qd38XQjL20jB7BfTZU8h/ghCmivlJYa/IQrVzHmg3rsPHXilPWjC6PTGlzrDT
 UmvIE7Cksnzci6YyvWhl8ABuTIUSFR/Bq+7gdcq3jDSRKWfgUJbr5+xo0sjjh8M9hlAP
 YhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
 b=yTw9iaItqxi2MFtGo7QugWcEn/H5nvA0j9Efx9WBZp7EtqMnN0CRhrANjHPLQId/hp
 Hd8OlUg+latc7jw2qpyQYoigFrsAXa919/vtFU/QbLCmgjAtyTQgLHn8Wg9SgdKP3BC1
 tsFoH5YjuGgybzx3AKykTnZRZd6FqGHouhH4GCy5/gtQRl8U3At9780We8KZzBLEl22y
 qnNOmYAM7W6S5bIs1/r2ugVMkoS4TzzAuVw+z/2szX1JUiVpTCIsl6xSAfLm5QBf80vy
 LNm7zn0/VGawl3goy9I5MbioC0OF+AVjM1/FlQhkRC4BPxKAo75avxxPphWRhTzWHnqf
 upQw==
X-Gm-Message-State: AO0yUKVdnzG96c0GO/4AIkHYl4iD4akioaGJpUxilBVmO/3bhe2g/azj
 diDyVpmw6nYFm4dT0s71Bs04jwPy/KBeSM4Vdb6Mqw==
X-Google-Smtp-Source: AK7set/MR6o1EBljJIfausK4TNfCevYS3wfBHGHm1ASRwt2JVCu4Tl6+7XqTiq/FidNJsl2qK9Axd3xTeY6e3XCB5qI=
X-Received: by 2002:a81:ad28:0:b0:536:55e5:2eaa with SMTP id
 l40-20020a81ad28000000b0053655e52eaamr1508552ywh.3.1677118213425; Wed, 22 Feb
 2023 18:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
 <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 04:10:02 +0200
Message-ID: <CAA8EJposxNgyCh+LUstVvBO3Pf3119mmwb6CijN8Ss6TWw5+-A@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 6/6] drm/msm/adreno: Enable optional icc
 voting from OPP tables
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 03:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
> handle bus voting as part of power level setting.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
