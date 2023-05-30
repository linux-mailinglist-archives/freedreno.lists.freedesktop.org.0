Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6323715DAA
	for <lists+freedreno@lfdr.de>; Tue, 30 May 2023 13:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6FE10E009;
	Tue, 30 May 2023 11:44:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E439E10E009
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 11:44:50 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-565a63087e9so57439447b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685447089; x=1688039089;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S9RhZ916M+s7tDZgpo9Wzznoebm/fAUfY5MYE+/drBw=;
 b=OKIoEEWyVizW6XkMyPO6QwCMHd/0iR5rmncpIrrQUQTlksDWz0wcVDYuWhketFlx0A
 Sfa8B942ObG4Kxcw5EP3m06QSc/TVMh19u2OKWiyvtB2xQFj9QOvTNeqkvoYjAZrPRBH
 d73Sf1ajmNzMqgTUhPS5x0CPF/gryqjpiy5QgeL08IEcS7YEjomUKk7qblD9HoI2wkM1
 pAyB1XFj+UAR46Gp7Exesye2q8N9M3Cql6pFGtgaIBJZFwvYQySIO4qTuXaHgasKuWSv
 9wKHT+X167H5pS120gtowatFGeqeZ4reAdUoU8+JOBW5DdVTkvtb1wqB5+NH8mE4wrg4
 b/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685447089; x=1688039089;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9RhZ916M+s7tDZgpo9Wzznoebm/fAUfY5MYE+/drBw=;
 b=GwR4pVfgVtXSriCnp90VqAfuKshOT0674tkVYp/GUZqqSLtTfiAdj7O8GUYzDWUYnV
 xp8b1eW6CHlJ9OPxT+8/qAeWL8hIoDjL2/52yqwg4KVh5NFocLgjhiZZPa/pzqHVW/Nj
 t+dTOsFCQHV2EqCGWESKpW+twI0wsJibV2J7GgwaD3cl/K/Xu94BBDA5awzDZepvKsg/
 8Aqllm1hm3b9xC4AUUoFzxMS1QlH906Wvr7DHs5p1lReOneOMCgkMDOmBBBHJDIMoNnA
 6tvLfDdG4N1ZRKF0RnyhlBTWcZJaLAN32uXaNIlWhkzIWAtP1NPqpc2LpQya3RKcRc0p
 f0cg==
X-Gm-Message-State: AC+VfDxs0zqlMycp3XeeSRbVM84wuIjMTvjOoxBsFfa/YC7uRCauv+Sr
 yaT/AxP50Ia/bn3PrnMdY9VK0V2v7CIjeWM6RuOM4w==
X-Google-Smtp-Source: ACHHUZ4hbxOl2LP2th0Gz1Dge04tp/BfXhVAvw6UvSmrbx4UBGt42Qesjqw4YEtzSIadW85OqQ9H/daPolj3cnlcyLA=
X-Received: by 2002:a0d:cc52:0:b0:565:ba4b:aa81 with SMTP id
 o79-20020a0dcc52000000b00565ba4baa81mr2348049ywd.45.1685447089579; Tue, 30
 May 2023 04:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
In-Reply-To: <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 May 2023 14:44:38 +0300
Message-ID: <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: [Freedreno] RFC: DSI host capabilities (was: [PATCH RFC 03/10]
 drm/panel: Add LGD panel driver for Sony Xperia XZ3)
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 30 May 2023 at 10:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi Marijn, Dmitry, Caleb, Jessica,
>
> On 29/05/2023 23:11, Marijn Suijten wrote:
> > On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
> > <snip>
> >>> +   if (ctx->dsi->dsc) {
> >>
> >> dsi->dsc is always set, thus this condition can be dropped.
> >
> > I want to leave room for possibly running the panel without DSC (at a
> > lower resolution/refresh rate, or at higher power consumption if there
> > is enough BW) by not assigning the pointer, if we get access to panel
> > documentation: probably one of the magic commands sent in this driver
> > controls it but we don't know which.
>
> I'd like to investigate if DSC should perhaps only be enabled if we
> run non certain platforms/socs ?
>
> I mean, we don't know if the controller supports DSC and those particular
> DSC parameters so we should probably start adding something like :
>
> static drm_dsc_config dsc_params_qcom = {}
>
> static const struct of_device_id panel_of_dsc_params[] = {
>         { .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
>         { .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
>         { .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
>         { .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
> };

I think this would damage the reusability of the drivers. The panel
driver does not actually care if the SoC is SM8350, sunxi-something or
RCar.
Instead it cares about host capabilities.

I think instead we should extend mipi_dsi_host:

#define MIPI_DSI_HOST_MODE_VIDEO BIT(0)
#define MIPI_DSI_HOST_MODE_CMD  BIT(1)
#define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
// FIXME: do we need to provide additional caps here ?

#define MIPI_DSI_DSC_1_1 BIT(0)
#define MIPI_DSI_DSC_1_2 BIT(1)
#define MIPI_DSI_DSC_NATIVE_422 BIT(2)
#define MIPI_DSI_DSC_NATIVE_420 BIT(3)
#define MIPI_DSI_DSC_FRAC_BPP BIT(4)
// etc.

struct mipi_dsi_host {
 // new fields only
  unsigned long mode_flags;
  unsigned long dsc_flags;
};

Then the panel driver can adapt itself to the host capabilities and
(possibly) select one of the internally supported DSC profiles.

>
> ...
> static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
> ...
>         const struct of_device_id *match;
>
> ...
>         match = of_match_node(panel_of_dsc_params, of_root);
>         if (match && match->data) {
>                 dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>                 memcpy(dsi->dsc, match->data, sizeof(*dsc));
>         } else {
>                 dev_warn(&dsi->dev, "DSI controller is not marked as supporting DSC\n");
>         }
> ...
> }
>
> and probably bail out if it's a DSC only panel.
>
> We could alternatively match on the DSI controller's dsi->host->dev instead of the SoC root compatible.
>
> Neil

-- 
With best wishes
Dmitry
