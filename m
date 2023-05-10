Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2386FE77C
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 00:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB91B10E56A;
	Wed, 10 May 2023 22:47:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D016110E56A
 for <freedreno@lists.freedesktop.org>; Wed, 10 May 2023 22:47:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso8840848e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 May 2023 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683758819; x=1686350819;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Lc9F8QaPJkxAnOe+Xl1C2QlUZazEe73HEcZR10o9E9A=;
 b=OUTeeS/IjRvUewaDFMBR2nz8cQVKPl25aHSFeXlJeYsY5sLhfm5KCpbDTVwyFAON4i
 p6VtfvVDwB3dHDu2QM07grzKk89qjcZ8HcVr3Yn6w+WspTT6KaAfRU33H4l2AN+FSkyT
 77GXjTUPUnZRizQz4h72jAQhbYda/SvDR/lD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683758819; x=1686350819;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lc9F8QaPJkxAnOe+Xl1C2QlUZazEe73HEcZR10o9E9A=;
 b=PghbNmXroCwylGidUQ6LUXwoVj0Zi5mDHVD2iqb0qejS/8J8nqn5UyJziAaWD2ca8S
 xnpPOL8kNviH6X49Dcf2XI9lKkdfVLNePFomVJoGr3dcah1vDhev4NE7NSPGMGRIIOpv
 ScKC8rcqz0CB7Z0sm5WkXUeAdt2yzTVe6SFcJzq0zuh4kDmV11YOsHAlciz7b4hy0Sfp
 6q/0od+c18KdTZExHc22E4++vzfaAsQIZtnbprovPZi3JgnqemN9rgcNpP0wgYtR4y1M
 d3IfL4C9W+oq4fzu86z3e5Jdr92Tdctte/bcTdQCHbgtSY5LZLmDikJiHL2HjDXN8MhB
 tFvw==
X-Gm-Message-State: AC+VfDzEYQFQZsARcZ1ccGEez/E7CQF1m8oLDAPnD5OPOn0srlXoAYP1
 FaCxmi7X0IcoJRv33BjLMznTDtlzGNu0apVWtoQLEw==
X-Google-Smtp-Source: ACHHUZ5POndhPxkoH7qR9oNGQ2z2nTWFZHH0gWw8KX3wXh6qJr+Gz7PeuHb1IydiRZeMJTRDh0ecvKmOW3536Z6hjDo=
X-Received: by 2002:ac2:4f8d:0:b0:4f1:2180:5683 with SMTP id
 z13-20020ac24f8d000000b004f121805683mr1967053lfs.41.1683758819344; Wed, 10
 May 2023 15:46:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 May 2023 15:46:58 -0700
MIME-Version: 1.0
In-Reply-To: <1683750665-8764-3-git-send-email-quic_khsieh@quicinc.com>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 10 May 2023 15:46:58 -0700
Message-ID: <CAE-0n532y=ARQ_+urEA_b3zUn+gKTu1fgK_siHNt3CpbLB9PZg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/2] drm/msm/dp: add mutex to protect
 internal_hpd against race condition between different threads
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-05-10 13:31:05)
> Intrenal_hpd is referenced by event thread but set by drm bridge callback
> context. Add mutex to protect internal_hpd to avoid conflicts between
> threads.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

This patch looks completely unnecessary. How can dp_bridge_hpd_enable()
be called at the same time that dp_bridge_hpd_disable() is called or
dp_bridge_hpd_notify() is called? Isn't there locking or ordering at a
higher layer?
