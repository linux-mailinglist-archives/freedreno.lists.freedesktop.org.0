Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A209787A03D
	for <lists+freedreno@lfdr.de>; Wed, 13 Mar 2024 01:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9C410E1BF;
	Wed, 13 Mar 2024 00:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ld+aJAai";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1630E10E59B
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 00:46:59 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-428405a0205so88421cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 12 Mar 2024 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710290819; x=1710895619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+04D6u+/MuKPrCCxQ1meOXYi6MthiRQ4bVsU1Ta9CV0=;
 b=Ld+aJAaifIhUqSr5JFdnTRYgtRxUyylCf2e6WYwLL6rv2rFXVqcaGrCgeKlkEeQvaP
 OkBqNfZ6ny0hxUbyOYN920g+TdDVm3jx4EPtfWZFZCiZe+7EApuUDVeGL8XXJBc/fGQe
 Gk69iJ2CL4loV6G83mlXWotcfIZ6J00/maRtixOOikVsaHRCu1m+WwzgASlsQbEhBYT3
 wUXY+/dal19UKLY4p1NT40/Ngj+GkKdGI9Rv0C/FCxLJOXOI3vHbbCAid5QQ68fi7ZMK
 FTJ0RBnuLHKXP1N6J28gONtFU8TYLHPI6vamMi80x8JXDw04nJW5bxbyX+A+Td8layJ0
 Q19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710290819; x=1710895619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+04D6u+/MuKPrCCxQ1meOXYi6MthiRQ4bVsU1Ta9CV0=;
 b=q/vdx6kW+QXaldo/yBB67My13jnw0P235iIIpkF6Z0XvDqdlBZXfcjM1XKIhdqswv7
 HI5ZdSRj6x76p62iPkY6XmKF4TkEomP0ockjbG/00QuHUvyl54ABSOMmr9DG8cCZL3Aj
 PskWfkpPD6LT0Wf/Vxpsp3wmmDcpBnAM+GILJRUprBB6wOj3yLxbUhtEZ6jShkmRhgGf
 i58mJJNtrnUKw54lmlXgH+lSvtpeouBVZ+hJk2GShMm4s9YdtVHIA8aycS5PIhR1U8IO
 mj1MNHa0yT/1Tr5fCx/dd/KHpOtii5THrrSa8CZPmKG9xjQOrZyqprAosu6CITsErpq9
 ab2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBaSqUkfPFIv/HiV3rjwA7xzVKdg11W8AaJR4kAdFkF7faFShS9qsmvr924NPMwbAHHBVtt0tJq+SyFsADbsYnlGj5suodSPMC9NJ2h2K0
X-Gm-Message-State: AOJu0Yx6Us4RUGTBDscztaurwE7euWTv27O9tWRkipQbYO/527ktCzZu
 thNthykQ/UiEbnXrvBI8s/6jg1QnIeTdF/IxNRL9ip5F9P1S2gN88GOjQVcDHI7KM9IfcxhIKJg
 pOG4JU42EavBjPVgfMgWWlhW/BinWizj9aEna
X-Google-Smtp-Source: AGHT+IEDNUZtHnW293+epCHuCd7X0kpy8JB6UScKG21DsvkhxYQyKtycIK7/9X0BOK18ToSUjuwEy0eQqZbYLoYTvI0=
X-Received: by 2002:ac8:5956:0:b0:42f:172b:a814 with SMTP id
 22-20020ac85956000000b0042f172ba814mr148134qtz.0.1710290818723; Tue, 12 Mar
 2024 17:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240313001345.2623074-1-dianders@chromium.org>
 <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
In-Reply-To: <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 12 Mar 2024 17:46:44 -0700
Message-ID: <CABXOdTfNaorDgyZT8owH6ypYpZMhVpUEcK8N4Mbw2UumA8Db2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Mar 12, 2024 at 5:14=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> As documented in the description of the transfer() function of
> "struct drm_dp_aux", the transfer() function can be called at any time
> regardless of the state of the DP port. Specifically if the kernel has
> the DP AUX character device enabled and userspace accesses
> "/dev/drm_dp_auxN" directly then the AUX transfer function will be
> called regardless of whether a DP device is connected.
>
> For eDP panels we have a special rule where we wait (with a 5 second
> timeout) for HPD to go high. This rule was important before all panels
> drivers were converted to call wait_hpd_asserted() and actually can be
> removed in a future commit.
>
> For external DP devices we never checked for HPD. That means that
> trying to access the DP AUX character device (AKA `hexdump -C
> /dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
> system:
>   $ time hexdump -C /dev/drm_dp_aux0
>   hexdump: /dev/drm_dp_aux0: Connection timed out
>
>   real    0m8.200s
>
> Let's add a check for HPD to avoid the slow timeout. This matches
> what, for instance, the intel_dp_aux_xfer() function does when it
> calls intel_tc_port_connected_locked(). That call has a document by it
> explaining that it's important to avoid the long timeouts.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
> index 03f4951c49f4..de0b0eabced9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_=
aux,
>          * turned on the panel and then tried to do an AUX transfer. The =
panel
>          * driver has no way of knowing when the panel is ready, so it's =
up
>          * to us to wait. For DP we never get into this situation so let'=
s
> -        * avoid ever doing the extra long wait for DP.
> +        * avoid ever doing the extra long wait for DP and just query HPD
> +        * directly.
>          */
>         if (aux->is_edp) {
>                 ret =3D dp_catalog_aux_wait_for_hpd_connect_state(aux->ca=
talog);
> @@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp=
_aux,
>                         DRM_DEBUG_DP("Panel not ready for aux transaction=
s\n");
>                         goto exit;
>                 }
> +       } else {
> +               if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
> +                       ret =3D -ENXIO;
> +                       goto exit;
> +               }
>         }
>
>         dp_aux_update_offset_and_segment(aux, msg);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp=
/dp_catalog.c
> index 5142aeb705a4..93e2d413a1e7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct=
 dp_catalog *dp_catalog)
>                                 2000, 500000);
>  }
>
> +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog =3D container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       /* poll for hpd connected status every 2ms and timeout after 500m=
s */

Maybe I am missing something, but the comment doesn't seem to match
the code below.

Guenter

> +       return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HPD_=
INT_STATUS) &
> +              DP_DP_HPD_STATE_STATUS_CONNECTED;
> +}
> +
>  static void dump_regs(void __iomem *base, int len)
>  {
>         int i;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp=
/dp_catalog.h
> index 38786e855b51..1694040c530f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -86,6 +86,7 @@ void dp_catalog_aux_reset(struct dp_catalog *dp_catalog=
);
>  void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
>  int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_cata=
log);
> +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
>  u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
>
>  /* DP Controller APIs */
> --
> 2.44.0.278.ge034bb2e1d-goog
>
