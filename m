Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB0621EE9
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 23:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004BD10E2E0;
	Tue,  8 Nov 2022 22:14:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222F310E516
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667944922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B4XOqV1gMleVpJRmsEaG0IDF2IsnRx/bBVmiudDCRhE=;
 b=U/4f468laQEdzCUAsyiTeWLvBNZAXt5uPw1x3L73MMAxxjI2P2C5m0ogQ7kxOl6/u0qt69
 aFht7XcccslU98p1MsVWXqUy5jkVRBVy2k9VdbiX0roZdAgDo9wZqU/ixl6pR25Omja9+r
 Imblz+y2XnZ4iRmPgHI+qkIYJCAwpjQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-OqkQJASWOei5WWNPVwfgOQ-1; Tue, 08 Nov 2022 17:02:00 -0500
X-MC-Unique: OqkQJASWOei5WWNPVwfgOQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 i9-20020ac25229000000b004a24f6e0f78so5371936lfl.23
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 14:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B4XOqV1gMleVpJRmsEaG0IDF2IsnRx/bBVmiudDCRhE=;
 b=IAZRr/oY59KyaFNJjg+sfpJajplTSCJllQG7VEgYRBlMstfey4dVdb3wRMM7AlMzeZ
 CSYP+wuU7tAlsuqaqXIlvuEPzqOpmU+if9NkVYAShH7AKuIY0dTVzSdfKM+P6GvMBOtb
 HdIak4MeSG8ZgWHlMsacc1VBI5AFFyi2eyrJmFoN4/RyEz4kUaV3smA+2ZDCrjgVw3Na
 1HK/prPOSDmgT9IRAddlr6z+ayutzHF+jlDXWjQSEA4AiYNMb/CWbEZ2T3Uoc9jo3f/C
 twYPEIWRD5G23+5J+ZH9S681D88T3eBWXll+6k/S3Q+/m6IZ10ssEbE3rkYbxx1e1fsg
 I6hw==
X-Gm-Message-State: ACrzQf0XPYX0nvv7A/JVWd9Cnb662kPBiII7/WpdTMXUkhe2KjkeZAZF
 CqSCkSp5l9q+7XYpPgiy9OGP7ltE4/Qfi9wnNEoTYDG0pNEqPXw/T2y7FUbDiS7bw9xU+SaUBM4
 jInjuu+30td9l4w0Sha7WCQPWghqN5Vc1dnTG/rCw3+Iu
X-Received: by 2002:ac2:5e35:0:b0:4a4:754f:e2d5 with SMTP id
 o21-20020ac25e35000000b004a4754fe2d5mr22681756lfg.77.1667944919422; 
 Tue, 08 Nov 2022 14:01:59 -0800 (PST)
X-Google-Smtp-Source: AMsMyM52Mtsi7gjV6anF7IJB1SSAqcpPVaiT1aF3M6yT6qKnkUV02vegAu4K8KA7JqOQICiIS1ew+ggq+sGeNFvuceU=
X-Received: by 2002:ac2:5e35:0:b0:4a4:754f:e2d5 with SMTP id
 o21-20020ac25e35000000b004a4754fe2d5mr22681740lfg.77.1667944919138; Tue, 08
 Nov 2022 14:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
In-Reply-To: <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 8 Nov 2022 23:01:47 +0100
Message-ID: <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Nov 2022 22:14:17 +0000
Subject: Re: [Freedreno] [RFC PATCH 1/3] drm: Introduce color fill
 properties for drm plane
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
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Pekka Paalanen <ppaalanen@gmail.com>,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote:
>
> cc'ing Pekka and wayland-devel for userspace devs feedback on the new uAPI.
>
> On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On 29/10/2022 01:59, Jessica Zhang wrote:
> > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > drm_plane. In addition, add support for setting and getting the values
> > > of these properties.
> > >
> > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > represents the format of the color fill. Userspace can set enable solid
> > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > framebuffer to NULL.
> > >
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >
> > Planes report supported formats using the drm_mode_getplane(). You'd
> > also need to tell userspace, which formats are supported for color fill.
> > I don't think one supports e.g. YV12.
> >
> > A bit of generic comment for the discussion (this is an RFC anyway).
> > Using color_fill/color_fill_format properties sounds simple, but this
> > might be not generic enough. Limiting color_fill to 32 bits would
> > prevent anybody from using floating point formats (e.g.
> > DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
> > e.g. using 64-bit for the color_fill value, but then this doesn't sound
> > extensible too much.
> >
> > So, a question for other hardware maintainers. Do we have hardware that
> > supports such 'color filled' planes? Do we want to support format
> > modifiers for filling color/data? Because what I have in mind is closer
> > to the blob structure, which can then be used for filling the plane:
> >
> > struct color_fill_blob {
> >      u32 pixel_format;
> >      u64 modifiers4];
> >      u32 pixel_data_size; // fixme: is this necessary?
> >      u8 pixel_data[];
> > };
> >
> > And then... This sounds a lot like a custom framebuffer.
> >
> > So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL
> > flag to the framebuffers, which would e.g. mean that the FB gets stamped
> > all over the plane. This would also save us from changing if (!fb)
> > checks all over the drm core.
> >
> > Another approach might be using a format modifier instead of the FB flag.
> >
> > What do you think?
>
> First off, we only need to represent the value of a single pixel here. So I'm
> not quite following why we need format modifiers. Format modifiers describe how
> pixels are laid out in memory. Since there's a single pixel described, this
> is non-sensical to me, the format modifier is always LINEAR.
>
> Then, I can understand why putting the pixel_format in there is tempting to
> guarantee future extensibility, but it also adds complexity. For instance, how
> does user-space figure out which formats can be used for COLOR_FILL? Can
> user-space use any format supported by the plane? What does it mean for
> multi-planar formats? Do we really want the kernel to have conversion logic for
> all existing formats? Do we need to also add a new read-only blob prop to
> indicate supported COLOR_FILL formats?
>
> We've recently-ish standardized a new Wayland protocol [1] which has the same
> purpose as this new kernel uAPI. The conclusion there was that using 32-bit
> values for each channel (R, G, B, A) would be enough for almost all use-cases.
> The driver can convert these high-precision values to what the hardware expects.
> The only concern was about sending values outside of the [0.0, 1.0] range,
> which may have HDR use-cases.
>
> So, there are multiple ways to go about this. I can think of:
>
> - Put "RGBA32" in the name of the prop, and if we ever need a different
>   color format, pick a different name.
> - Define a struct with an enum of possible fill kinds:
>   #define FILL_COLOR_RGBA32 1
>   #define FILL_COLOR_F32 2
>   struct color_fill_blob { u32 kind; u8 data[]; };
> - Define a struct with a version and RGBA values:
>   struct color_fill_blob { u32 version; u32 rgba[4]; };
>   If we need to add more formats later, or new metadata:
>   struct color_fill_blob2 { u32 version; /* new fields */ };
>   where version must be set to 2.
> - Define a struct with a "pixel_format" prop, but force user-space to use a
>   fixed format for now. Later, if we need another format, add a new prop to
>   advertise supported formats.
> - More complicated solutions, e.g. advertise the list of supported formats from
>   the start.
>
> [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>

Agreeing with most of what you said here. However, what's the idea
behind a format anyway? The 4 values provided here are fed directly
into the color pipeline which seems to define the color channels it's
working on as RGBA (or doesn't define anything at all). The only
reason I can think of is that hardware might support only ingesting
values either in a format with high bit depth color channels and no
alpha or a format with low bit depth color but with alpha, so choosing
between the formats provides a real trade-off. Is that actually
something hardware might be restricted to or do they all just support
ingesting the color data with enough precision on every channel?

