Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80355A54A
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251110F599;
	Sat, 25 Jun 2022 00:13:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27910F5AC
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:13:36 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 88so6855653qva.9
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFVKp+DIpzgb4hUKHdKfLQTpwjibehhe/edtSOh7+n8=;
 b=zaRjLUy3jhfIOSxy6FZPbYqI+7Xgb6YLibXNuwYQ5A8bs8atdxDU88en2htNoOlEIz
 gRqyMO2J2Na5Gnlxg3Xwi93BBLh6OrvxUfvf2GLLkwJ6KQvjHxZ2vYKGefI41L5Tqw0y
 paLSbUXLHWvIXOyhFa6sbfqdQNYBSd5qsTZLJAMe+pg65U5hcaMiY9WS/VRDdicTEg81
 KJhnBaRNPkGoFN4KomnvytXOTVUPtwez+AoFbf3fywep+MntFmQyPnveLKIVZKXHVyWU
 Qxe0ykMA6rLm6e0m3CM2bvT4GXbe2KujuaCFHRyyrWNDFn229olscomTDsArRwNxaKnP
 SSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFVKp+DIpzgb4hUKHdKfLQTpwjibehhe/edtSOh7+n8=;
 b=1eBNOPWpwwexRBXT89ogjHea459vX0ViTaWBQ6NXu3wGxYIZGqdGTURxP02U3Kv1tv
 YZWrRRukgFwUH5C1QG/ODYyTvxLe9ycwlFz9CBy9NYY4m40YhmLc2tE4qj/6vd5aSZOM
 e3VbGQ1Mc9f5soNEKleILjlnZ6GuMzdnblBAC5Cag2CIiV0+KRNcFqTSym/ZTha7gaIo
 8sRx0eIi+kHrTK3ZDaJE35Y0z/4rSqTJBlT1RYdQZNKR/yQ22NwxXav6nN2QxxjGdQKT
 8fhUDQzqpYMQ7/iR8fd/+PBBZpox9i8xqeBeGrkG89GOz2REjN1h9EfY8QW6R2NcwQzu
 +vnQ==
X-Gm-Message-State: AJIora+8VS28ZxRrnNemuz4dFGb/nLJvoVUA7dsnQg6cEGdQqn/tstyT
 kYEsZ44knW5wsPJ+qy6PtCowF8xUAU8xn+ibg2VcRw==
X-Google-Smtp-Source: AGRyM1uJYAGMPzovKAZ1R22Ezl34Pn7ac31FoRY4+69xihwkidiDi9wThNin4zqhrvUnvGbwnDRcrnPV2023K7t8ayU=
X-Received: by 2002:a05:6214:d66:b0:470:4528:bbd5 with SMTP id
 6-20020a0562140d6600b004704528bbd5mr1383493qvs.73.1656116016045; Fri, 24 Jun
 2022 17:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220624010703.541191-1-sunliming@kylinos.cn>
In-Reply-To: <20220624010703.541191-1-sunliming@kylinos.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:13:25 +0300
Message-ID: <CAA8EJprfCV259z_MWUN1yYRkAaPOJcpoZDcKiwKHwTdWaPeyww@mail.gmail.com>
To: sunliming <sunliming@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/dpu: Fix variable
 dereferenced before check
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
Cc: kernel test robot <lkp@intel.com>, kelulanainsley@gmail.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org, robdclark@gmail.com,
 freedreno@lists.freedesktop.org, dan.carpenter@oracle.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022 at 04:07, sunliming <sunliming@kylinos.cn> wrote:
>
> Fixes the following smatch warning:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
> dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before check 'conn_state'
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
