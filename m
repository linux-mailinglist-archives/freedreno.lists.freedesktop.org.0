Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D56D7206
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C5C10E2F8;
	Wed,  5 Apr 2023 01:35:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13710E2F8
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:35:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j11so44627094lfg.13
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680658552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoyBCXStsqxpfmpVlFcXygr4xYwfXrntl6u3DwEVxas=;
 b=rdBjaUsHhiuWUMKYoRit98wt2EcyiqcOLAn0u1YvUxr2ZxgM4Rdm4qHXFe95dBcN0Z
 wo20Hj9faKL31PTxOTPM79L0PUmRVK39fWSsYjWdBQQSbF9jwxqTBOMjweqdpEBNA4IH
 g0OFbxrZ5dTW7W+9HxloUtL40a2OPpOQoL6C10HxZhYwJ8m83JAcwRG60tLPaQ+UJwN+
 GhhABgoHoQL8g1iERq+Zoklx10HfAI+XQ/DyQ+srcUxV6RhixnzzBQ+1IC1uNxHvdjzN
 3IKYNNEA5bN37+altTVvwCikBAR6FkDsABRR1m/0bmBIkvSivfMejOb9G54x+VnQmHgW
 n83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680658552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoyBCXStsqxpfmpVlFcXygr4xYwfXrntl6u3DwEVxas=;
 b=y7SA16yz3NDAttrDzN9iNAv0ebiA/6bOE0rZGh5t68sAmOmUhPVdDr52XRC2gcKPVg
 N98zRRYM4+7zhf61mQ13geIbaTNq8B/B1RtBFPvlCUXPEcaWDrhNYdZAAuhrGz7HGOdu
 NztBhllHOBVD6w2c2xDdfMG3avVpULnDbjbiPAIOhTMkZve2wVVHiH8OgyK9Qnksz/HJ
 3YIsZlRoxnhmMkWGYI5NePjUKAmFzN7D0mRH4Fm7/Nw/lJi1j0TMHQqIphQTiG3agXQp
 Iup7u9AJxZCYsXuOqRmw68HQezcg5Vd+qTpx98g1FGwXbJZgHfeHUdbVPSH7Kyos9AwY
 l4Nw==
X-Gm-Message-State: AAQBX9dp8ccIYECAM0DGP7r4D7ZaFPeSNkn5xUL+QA0XStxuVe2i0WwD
 CD58TKVPeynchfs20kIYYjoYvA==
X-Google-Smtp-Source: AKy350bpv2i7LVGztpCvL9K+IopcdFKdyv11QsqYGtjWIc1F6UdHNMt0SaBiG8OgKGj3TFFgu8uP0A==
X-Received: by 2002:ac2:5083:0:b0:4de:d16f:3938 with SMTP id
 f3-20020ac25083000000b004ded16f3938mr979980lfm.53.1680658552391; 
 Tue, 04 Apr 2023 18:35:52 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 18:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Colin Ian King <colin.i.king@gmail.com>
Date: Wed,  5 Apr 2023 04:35:48 +0300
Message-Id: <168065850331.1260361.4926214097299835454.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329093026.418847-1-colin.i.king@gmail.com>
References: <20230329093026.418847-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH][next] drm/msm/mdss: Fix spelling mistake
 "Unuspported" -> "Unsupported"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 29 Mar 2023 10:30:26 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44310e2964f2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
