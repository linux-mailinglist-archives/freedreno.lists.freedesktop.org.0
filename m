Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA391347FF
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2020 17:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0A56E062;
	Wed,  8 Jan 2020 16:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433E6E062
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jan 2020 16:30:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v28so3030909edw.12
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2020 08:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmdeZPKAzWMubu2XNK5KT8RXc9jP8l1vb7Bp6B2rpwE=;
 b=a+By21YMez7ITO7fBJ5SLtyuGYWCEAYTizKG265xum56+yJwU8VkuDpOIB9EmPTwpZ
 z8ktcq3D4MzSK3oQsul8sGaxE5b5CgNMzR4E91Me2KfuJviwNSsJLeIYQEOGXWsztwhJ
 vNtwFw7D1wOLUWaDQZTo/e3maaxky7GzLFRwks4F2Bp32ffT8VxHSCubnyguDjR2Px2V
 eTvj6oSGecD7iN1nIDorZ08CLcYaU7GCNfYMfH1Q6mD2PyPBUn5QJQw33R6NxyPQ87jf
 YzrWq1mkpKwL+vcCdQ+NEJGZc1ATYIJCDMkfeHtIgvrvZFSgNpmF5cuOfmI4sHTLSF37
 z0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmdeZPKAzWMubu2XNK5KT8RXc9jP8l1vb7Bp6B2rpwE=;
 b=T7e4ysxxV/2pnZxZVaD5Q+S1nxQnb+FnNY9KTJxLn+WoBwcWnDfEjMjkta39zRw3ke
 ZYcM61166hrvW1SVSyST9KiPGbcgaIU54LzW1Cr80s1BkaX8xAlhle9tdEZu28DNejlD
 35stgVPSbfiHnPUqkKhNRF1Th8bj0HuosQw/IodBzMLyHLj0ZKBTUaDBU7rqp+KefbVd
 ThovzJ+YcPfZXxs4UcW9RYgyE+HkpeVVJqIZQYPuQ4hnJRvy6vZnWY4lB8LBmABjwMLW
 QYQIYbQmpbGdfR82WpZnliZMbe8YunKBzyUFLcg5vHl6UzV8EpxUINDtIpQDCDvpDZpA
 EfPQ==
X-Gm-Message-State: APjAAAWOVYjGV3mSIJU5Bx6g4HKnSpf6yP3Vu1bWOMfRiCVwsylLSMQU
 iwNsKsaNgROK80/g1Qbc06Q48BhG9bLoKm56qO4=
X-Google-Smtp-Source: APXvYqyQOzz6ctl8+x8JNHU9GUZ2T9OCNNPHssMymx62PLknY+EMQ1OGWhEPaloBmbuu9VP3yynCUB3xfwFaEQBhE+Y=
X-Received: by 2002:a17:906:2296:: with SMTP id
 p22mr5818691eja.269.1578501053123; 
 Wed, 08 Jan 2020 08:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
 <37d0baaa-3f94-9414-88e7-7e849b0c5de5@redhat.com>
In-Reply-To: <37d0baaa-3f94-9414-88e7-7e849b0c5de5@redhat.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Jan 2020 08:30:42 -0800
Message-ID: <CAF6AEGseE9iV1xDd1_hRDiKp0-a1usk+xqnyyqbuphwsvLTZmQ@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm: support firmware-name for zap
 fw
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
Cc: Rob Clark <robdclark@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 7:38 AM Tom Rix <trix@redhat.com> wrote:
>
>
> On 1/7/20 5:38 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Since zap firmware can be device specific, allow for a firmware-name
> > property in the zap node to specify which firmware to load, similarly to
> > the scheme used for dsp/wifi/etc.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 112e8b8a261e..aa8737bd58db 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  {
> >       struct device *dev = &gpu->pdev->dev;
> >       const struct firmware *fw;
> > +     const char *signed_fwname = NULL;
> >       struct device_node *np, *mem_np;
> >       struct resource r;
> >       phys_addr_t mem_phys;
> > @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >
> >       mem_phys = r.start;
> >
> > -     /* Request the MDT file for the firmware */
> > -     fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > +     /*
> > +      * Check for a firmware-name property.  This is the new scheme
> > +      * to handle firmware that may be signed with device specific
> > +      * keys, allowing us to have a different zap fw path for different
> > +      * devices.
> > +      *
> > +      * If the firmware-name property is found, we bypass the
> > +      * adreno_request_fw() mechanism, because we don't need to handle
> > +      * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> > +      *
> > +      * If the firmware-name property is not found, for backwards
> > +      * compatibility we fall back to the fwname from the gpulist
> > +      * table.
> > +      */
> > +     of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> > +     if (signed_fwname) {
> > +             fwname = signed_fwname;
> > +             ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> > +             if (ret) {
> > +                     DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
> Could adreno_request_fw be called with fwname if request_firmware_direct fails ?


*possibly*.. initially I avoided this because the failure mode for
incorrectly signed firmware was silent and catestrophic.  But Bjorn
tells me this has been fixed.. in which case we could try and detect
if it is the incorrect fw.  I need to try some experiments to confirm
we can detect this case properly.

BR,
-R

> > +                     fw = ERR_PTR(ret);
> > +             }
> > +     } else {
> > +             /* Request the MDT file for the firmware */
> > +             fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > +     }
> > +
> >       if (IS_ERR(fw)) {
> >               DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
> >               return PTR_ERR(fw);
> > @@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >        * not.  But since we've already gotten through adreno_request_fw()
> >        * we know which of the two cases it is:
> >        */
> > -     if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
> > +     if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
> >               ret = qcom_mdt_load(dev, fw, fwname, pasid,
> >                               mem_region, mem_phys, mem_size, NULL);
> >       } else {
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
