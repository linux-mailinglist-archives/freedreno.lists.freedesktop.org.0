Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD750EA1C
	for <lists+freedreno@lfdr.de>; Mon, 25 Apr 2022 22:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3C510E212;
	Mon, 25 Apr 2022 20:24:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F79E10E19D
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 20:24:55 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so11593211otn.8
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 13:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=i/cbTDQy63LDQhOihWzHzZUmvcSW7IqWrJf3iJytnOs=;
 b=HNP4FnWUAWSVYDGDBPgD8iux+2z7R28TGzFiVrDlHmpIf05Co3eDVAciUrDqWte8qL
 SmiZGLOnXM/1FqL4454+qEox4QsuvNukIAGQ/PdKidaICzi05UiogyTi26UaG/BRQk4O
 i5biSKCOVzl33MfoNv3ZraKE9WsGM/5qpSpR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=i/cbTDQy63LDQhOihWzHzZUmvcSW7IqWrJf3iJytnOs=;
 b=PQ1bGW7dXqW4c4TVUqEPHw9Ge9qpMVjDaZ38YA/GNgK38WsLa3CuIpK+hROA4QeKGf
 s4tzQ9twjGezdKRulSkRjLJi0bIPqWzwQcjK2vYpiUQ+ZUhXDsPj+WVk4EEw8jW/SjAf
 tP29/ifSi9YkJFDp3weFqnM/eR+UrPN6yKSKJiGS+Tid7ghU4Ucj30waHs3Rok7lzUGW
 KjUGQ5HftBy65TkXDufl4fyiuAmhJMG0odMU2aYeNqwDXeewrC5396F5USeqca5d3at8
 ZMNSy3AKdAOYw40AnY+4z3MuNu3KwXJl47cffxkXzrk/FJhPXd4dUEYaGJfrQCz304mX
 j7+A==
X-Gm-Message-State: AOAM531aeLx84EFrYcPkWVx5H9uUMPFyab2Cnkn3vsqzspRxHWvsaCTb
 o8p2uO+pElULY3SxsNa5uX1kQeTjDAVRdkVoyJrQ9Q==
X-Google-Smtp-Source: ABdhPJwVqbmVCPVHZaaa+iMgaqmo2o0oIEdpUhkFrQMPWCAx0UGWznDThN+OMIc0e6bI2J92JJDahtpwrSyFiUV0n+Y=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr7176514oth.77.1650918294748; Mon, 25 Apr
 2022 13:24:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:24:54 -0700
MIME-Version: 1.0
In-Reply-To: <20220425122223.7415-1-guozhengkui@vivo.com>
References: <20220425122223.7415-1-guozhengkui@vivo.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:24:54 -0700
Message-ID: <CAE-0n50a6K-UbG1xM+Au_-f1k98-uth8a__2YzzpZ4F4qBbBoA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guo Zhengkui <guozhengkui@vivo.com>, 
 Lyude Paul <lyude@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Xu Wang <vulab@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: fix returnvar.cocci warning
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
Cc: zhengkui_guo@outlook.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Guo Zhengkui (2022-04-25 05:22:21)
> Fix the following coccicheck warning:
> drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c:24:5-8: Unneeded variable:
> "ret". Return "0" on line 75.
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
