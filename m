Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO0DGo9OkGnUYQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 14 Feb 2026 11:29:35 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44E13BAC3
	for <lists+freedreno@lfdr.de>; Sat, 14 Feb 2026 11:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4DA10E242;
	Sat, 14 Feb 2026 10:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zZbCleZI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0010E288
 for <freedreno@lists.freedesktop.org>; Sat, 14 Feb 2026 10:29:32 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso1660657d50.0
 for <freedreno@lists.freedesktop.org>; Sat, 14 Feb 2026 02:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771064971; cv=none;
 d=google.com; s=arc-20240605;
 b=jhVkBdxws549R5xeektvW8R6AtvWQHFVvktH99kTnUZDSZ/LiscizZ+Kn94lRPMo8W
 zcbg9sFRmqRStdRFgETBAvOxjr0hCR4coxD35l0qm5wjEn7ti9sQkcvky92buyJ7U7s/
 zHGEmlhr6OiuIhkfOpamaoI0KfInG81UqnGRCJ+pV72fyBAxtRMxMhWYGWploKWQmgq9
 NszVt+pB4Bk1pJdzg5sNgOrJlYezVZYlfAk/FQF3J3BXoP8rrWwzG3AI8mNVby7Y7V9B
 mVRZX8Ca6UqWNvHWmyh/Yd1N5OXacWYfHFMzXbr+5fnjYny/UrgkLvAqK6Yv6ONts7vQ
 h+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 fh=WwEECbGFtI0Y75OMatbOESsc3Dr9sa1A0r2/PLaPpr0=;
 b=HFRcs8++n7Mus7OZRk/TzcfH7lFoNsDtVD+imaWNBG8KHADKuXOctVBlC5xqhJ2bRA
 difG8/VXMLMYVGA3gpKFkZsVWlZLopCm3VCYWR3hXWjqHynt+1/DhRkCxG3dRG4ostvv
 QIEFVZQHFUipSrwKEiWN6mQ9U5T0cxM6wPRnp/o1+eYeBJOHxms/gWaMvDtAcnhQT1+z
 e1/Ne80gMLWnzYyvtGDNeeL8QJN3Jd6LC0axk9LVw2RwaeybdXx9e9Ku+PEGhFqVLIj6
 XDJzLb4JIrcWiBhMZ7WjeOeNJIKEtkfPU65xfQ87EN2HrOGXdc+ZOFiNXQdSLa1AwwGD
 uNcg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771064971; x=1771669771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 b=zZbCleZIF0Wvga9rRfBnGaXjjCpHJegfSxRxv3Q+9X1KAdS7huq5O6guxoScN/Vfla
 H0XqbkiViC6zsJn5/cAstik/nsCMgFZQuJTPXPJ0qESLmbPGPg8Re+e7LH5ML3D291Xj
 2evTDQ7dzhkVG6Up/plcRCq1VJg130EDE3JyLBUgvPF+lYb6ve5hAFoqurNqqcPKhDVo
 cgIIygDz/Vtm6R55kHyNq2PT8vSUptLVzocgTo59esPbAan0n55p+0HzWvoSg4xROI9O
 7TDhPyJuCJG5R0hyxIEytUTW9At5I7vLgn4mYe0rRlCRfJAtaIUOCmm2EwDKKkIEFBl5
 am2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771064971; x=1771669771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gcmTHiPmRVpe2FcnwvwiyGljW5AeBLZNUuFg0iLgKKU=;
 b=dWJVCXbwwWF8CkOHiIyVydREPkjm5RIvePHNHGnGKRX11cF2iMhKrda21PpGz9gu9s
 AjPty2q8pTnQcHPfRrfElLd8dMq1ro9QX2edhbe2RWRm+kaWzZ+mbwWuO4b3vIc9y9k/
 kJRcjtz+VsVHP+uAZ8BkYpAg6SeZZVc0A4N1BiGZzhz++fVi8ddkeeb98xGyJP7bEMCE
 3fkqu9hPNcP38i8BkirxdR1DiHHJmF1C8No0l7qBvG9p5qaDMhnm50a3Y4G5JTsEuX6z
 UOQxYg1ceW3h5IWhgQgfBRe6cFSOiCBcSIsfQJFQ0mmR823bAzQAJ0jeTI+O/VyGu8MS
 m8/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWS0O6hOLp2///mNakXjChJ3DZ0RUWAOPyLdjXbNP6fIPDEZzGxovsaB0IsC4DIuHpe00VBssc65I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGOgLRO2qpJqzhoo9zzLjZnFL11EBOi2JCKTAb2C1V5obT2Eok
 KnyAAzlUpPomsL+edM2vrQ5Er0Xx5N1En5/NZMGwe5gHWhwVI+73/E1W5TKbiFsv+7CNRPF5LeU
 GrEHsDxi5KKFgRisb67g8G3vmKfOaWCAqNd1uCJvcEQ==
X-Gm-Gg: AZuq6aLWOdkqLNpoNpYGwQMbrb14vsbJS6jLTo2xIcu5v4Z5JRPUF7MzaZc9EYMfNiN
 24+yg8KJ3Vi0rtfx3cCSVQGTa5vsA6X1K2/bB5q2DnLBnRTboIniTLmUKVF0VdFcuONwmjNNpnx
 bTwA5N7reohtmtD8vCauUvBsj++qnF1VnNNIej9eGxclzGTb0WIOBmnwKntVP8fYvgSz41f8mmV
 4PG55oNZPn1YiY7a64iXESguUDPrIgaArY38aIFYapjGGR3nND4JGTTe7//fBH+9Jb/VSUwT4vN
 3fl1tE1ih6vLcQ==
X-Received: by 2002:a05:690e:1409:b0:643:1ef1:9613 with SMTP id
 956f58d0204a3-64c1979b6d8mr4149787d50.15.1771064971290; Sat, 14 Feb 2026
 02:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
 <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
In-Reply-To: <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 14 Feb 2026 18:29:20 +0800
X-Gm-Features: AZwV_QgDlwmO9K_rYUkz2DZ3LGWafQXwiCWr_9F3NtQWs4yIhGJxH2WUyeofRHM
Message-ID: <CABymUCM58jptRgqXfMJUOyRU7KK3aWdpZRQ73Q9QzhBDdKJamw@mail.gmail.com>
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: AC44E13BAC3
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
2=E6=9C=8814=E6=97=A5=E5=91=A8=E5=85=AD 00:53=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
> > dpu_plane_atomic_check_nosspp() currently handles both plane
> > validation and plane splitting. For better simplicity and to
> > facilitate future refactoring, move the splitting logic into
> > its own dedicated function.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++-=
--------
> >  1 file changed, 36 insertions(+), 15 deletions(-)
> >
> > +static int dpu_plane_split(struct drm_plane *plane,
> > +                        struct drm_plane_state *new_plane_state,
> > +                        const struct drm_crtc_state *crtc_state)
> > +{
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > +     u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     uint32_t max_linewidth;
> > +
> > +     if (!new_plane_state->visible)
> > +             return 0;
>
> Wait... This still isn't improved. The dpu_plane_split() function should
> not be called if the plane is not visible. Move it after the check.
>
> Yes, it is currently a part of the code which is called before the
> check. But there is no need to keep that.

OK, will revise it. Thanks!

>
> > +
> > +     /* move the assignment here, to ease handling to another pairs la=
ter */
> > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +
> > +     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
> >                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> >                                   new_plane_state->rotation);
> >
> > -     pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> > -
> >       return 0;
> >  }
> >
> > @@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > @@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (!plane_state->visible) {
> >               /*
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
