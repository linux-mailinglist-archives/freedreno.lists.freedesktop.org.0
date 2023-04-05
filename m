Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FBE6D7221
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631E10E2F8;
	Wed,  5 Apr 2023 01:43:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4152210E818
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:43:57 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id k7so5331708ils.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680659035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8kHzkX9SzRAkXXCj8yo/EKVJUuQ4P1xn/63qVUInQs=;
 b=i9T1CFuEPq6knTYwkWxspjaVaE3oVJ+xHE8V/HWUGqp4KihyT8cD6A4jXo195Hs1TB
 3Nlj3keIDe/Kc4XP1YSA+dsQ2AryZqABe6/cdtCGUVwcFnd38a2uBOc5h6ZKIQs6ymfg
 Ig39Rfj5g4tTuBH3zm/mD0w2GEXNkgrRaaCVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680659035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8kHzkX9SzRAkXXCj8yo/EKVJUuQ4P1xn/63qVUInQs=;
 b=CighbFS9z23rJ0+3hRnQy7Hb9Wm01Ngjo5ZhdEe/CrRxZB0uJQEvzzKKeWgpyWQt3Z
 QT9WXuFpEpSTaL9ywgXZogkoTOBFUfJXQTtf3SbmPpcBdwLcrtKIlMOj5yJvkzNj0yGJ
 FXsOTlEJO6nAWbMVez2KQAnvaSrjFEa4jpoblwak74Ld5ccRIDSWntCbxTDw01+qT4BE
 KNgrGx64Xj4fSGOi+rQaR7scMav8gDbHqnORn4G3i7qqBIOkkmmZJatqavatFhw5h1xO
 z7cVf4wWlBcNzC7sEKfsebTZ7kTqwb+yX5HlQA1TupzZ3JwHxDUTTP1ef1IzWWg6QbdP
 ZRmw==
X-Gm-Message-State: AAQBX9fbD62mdMV1lhWJ9bIhY82v/ubYE3edJu0BfrEM94L0jylg+fdv
 nNFpMxNWNspdbQND/JdjHxW1cF8y6KxGXkE90Wk=
X-Google-Smtp-Source: AKy350YICI6PP52F3ybxtWCNngC673iYuq8HevpOm7QyrmJ7wxbL0ApFI3TAdrPpZREwHVO3xd9DVw==
X-Received: by 2002:a92:c504:0:b0:325:a728:808 with SMTP id
 r4-20020a92c504000000b00325a7280808mr3297447ilg.22.1680659035362; 
 Tue, 04 Apr 2023 18:43:55 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 o9-20020a02a1c9000000b003c4f35c21absm3516642jah.137.2023.04.04.18.43.54
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 18:43:54 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id d22so14208416iow.12
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:54 -0700 (PDT)
X-Received: by 2002:a6b:d010:0:b0:752:ed8d:d015 with SMTP id
 x16-20020a6bd010000000b00752ed8dd015mr675791ioa.1.1680659034009; Tue, 04 Apr
 2023 18:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Apr 2023 18:43:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSHmQPtsQfWjviEZeErms-VEOTmfozejASUC9zsMjAbA@mail.gmail.com>
Message-ID: <CAD=FV=VSHmQPtsQfWjviEZeErms-VEOTmfozejASUC9zsMjAbA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v1 2/3] msm/disp/dpu: allow atomic_check in
 PSR usecase
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 31, 2023 at 6:59=E2=80=AFAM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Certain flags like dirty_fb will be updated into the plane state
> during crtc atomic_check. Allow those updates during PSR commit.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can confirm that this patch plus patch #1 fixes the typing problems
seen on VT2 on a Chromebook using PSR.

Tested-by: Douglas Anderson <dianders@chromium.org>
