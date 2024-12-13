Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66279F00C3
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 01:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5920B10E096;
	Fri, 13 Dec 2024 00:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qe7OMpJv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A18B10E096
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 00:28:23 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e388503c0d7so787000276.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 16:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734049702; x=1734654502; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0kEf3pmVjhYgIaUUKMj8/qv2yfYKhGsnNuzTFcwe8d4=;
 b=qe7OMpJvx8Cn9tm+YzaL71SN1LZxevbvoxMJPaQbpbbhJkcosuup/CfOJLmBggxXHz
 qpWCqAS4SweWAb4UBIMXZIXtX4MZ2DTE0ApOD75V9eSzTGdNVoqo5QQNcZs2RrF/U/fe
 MkUTAek5OfCH9DOf3+edWoVmUoBVZJQ0+E1q9ElwgAXLQh3Op9jwSsZYYmLWQR523AlR
 7BzjxR58AGoyY1Gpy86X/008B+8rkH1QGmqXRFQ+0ri3TTUZbqbYTN2t5SZ9ZyFwk+5x
 nhlgyPGSWzcYHKmdVxY3Rzsrao5wlc1DqDvbxL/0WR5/1t3KypuJ9RON2MaiYkZxa9fj
 xacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734049702; x=1734654502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0kEf3pmVjhYgIaUUKMj8/qv2yfYKhGsnNuzTFcwe8d4=;
 b=hMam8xV8XxXjQvdeuyA4piDyYJOi5bP5NnihuH9b853ZBytZ21qy2BfxolVQ+UgpmF
 j1FudKByBb/6YlbW2hbPfUWrVnvjvbrSfLB6Z1J+c4yI8yAfobFnop8VTwgCXltxuG88
 aLkDM/wy2tkH/X5pVuKtuSfI1w4iXM2MEPwKYLWJ+VPogQ4LKf1vpBliWXxkUP9pKOCf
 oTe5U40NiSVTO9Y3VqNoyxQW7Mjq3uNGrkiVxHbw2DCHd+JvRUw+1oCqTb8A1kgsP6cF
 GGdYnHzKub4zFR8YQybEPwwIDXRRM8LE6zCBXPSJIo4IcqZS1P+ZtBAAz/xN02e9hrI7
 hc2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV89AvP57x+880GGRqVmJ5p0qUnEwcHpUGRRZyIR51/euCDCR9fowLt5gTtvS3EkYuZCYErr+Lbgpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfk04xI/z0AAzgvNDnypr7pl5BdBs6BWjWOYoOSVhMTJcR+5ck
 6in9rdW+d1VffGNGX13fHzReddPXrLteyE5szP7Fj4ahwGDQXUOJKLe4xBeJ48owd4eep8AQAvm
 bQHTqsnOoqYAEcQzhnbaAPlOZUnOU24WK9dphKw==
X-Gm-Gg: ASbGncv56b6hRXyKWY/EfJJG2u8e6Km3/sbk/D9oIuwWSxBj6YSDVfaVVMfXbJOx/8k
 iWD8yI/TWyzgaa2C5khbuu1Y/qSeTKSYT480weg==
X-Google-Smtp-Source: AGHT+IEYPVyTc8vD6d/ItX+UznJeKgYnrfB/BFGVU0tIN+SAmCWvJ/BvkdZEmbX6bM9NlANsTaRFmznQ2EKZ2PHSVm0=
X-Received: by 2002:a05:6902:2e0f:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e434a541645mr606573276.16.1734049702044; Thu, 12 Dec 2024
 16:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
 <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
 <CAA8EJpqO=AjVGEnZHNbM5+Mnu2gMN96kABBLM5XHh3NMMGFtjw@mail.gmail.com>
 <9a9ff3a5-5c01-45fd-a89a-b8305baac5bd@quicinc.com>
In-Reply-To: <9a9ff3a5-5c01-45fd-a89a-b8305baac5bd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 02:28:11 +0200
Message-ID: <CAA8EJpoF1B4mARmSmEhq9qUfMFxCF-+W1AVDnOLniM6F67=yvw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 13 Dec 2024 at 01:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 2:28 PM, Dmitry Baryshkov wrote:
> > On Thu, 12 Dec 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> >>> to program audio packet data. Use 0 as Packet ID, as it was not
> >>> programmed earlier.
> >>>
> >>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >>>    1 file changed, 66 insertions(+), 222 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> @@ -14,6 +14,7 @@
> >>>    #include "dp_catalog.h"
> >>>    #include "dp_audio.h"
> >>>    #include "dp_panel.h"
> >>> +#include "dp_reg.h"
> >>>    #include "dp_display.h"
> >>>    #include "dp_utils.h"
> >>>
> >>> @@ -28,251 +29,94 @@ struct msm_dp_audio_private {
> >>>        struct msm_dp_audio msm_dp_audio;
> >>>    };
> >>>
> >>> -static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
> >>> -             enum msm_dp_catalog_audio_sdp_type sdp,
> >>> -             enum msm_dp_catalog_audio_header_type header)
> >>> -{
> >>> -     return msm_dp_catalog_audio_get_header(catalog, sdp, header);
> >>> -}
> >>> -
> >>> -static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
> >>> -             u32 data,
> >>> -             enum msm_dp_catalog_audio_sdp_type sdp,
> >>> -             enum msm_dp_catalog_audio_header_type header)
> >>> -{
> >>> -     msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
> >>> -}
> >>> -
> >>>    static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x02;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> >>> -     new_value = value;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = audio->channels - 1;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -             value, parity_byte);
> >>> -
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x02,
> >>> +             .HB2 = 0x00,
> >>> +             .HB3 = audio->channels - 1,
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
> >>>    }
> >>
> >> This patch is changing the programming behavior.
> >>
> >> Earlier it was using a read/modify/write on each register. Now, its just
> >>    a write. I checked a few chipsets, the reset value of registers was 0,
> >> so that part is okay.
> >
> > Except that it was not a correct RMW, it was read, OR new data without
> > clearing the bitfield, write. So it has been working mostly by a
> > miracle,
> >
> >>
> >> But, for the MMSS_DP_AUDIO_STREAM_0 register, earlier we were writing
> >> only the upper nibble, that is bits 15:0 of DP_AUDIO_SDP_HEADER_0 was
> >> kept as-it-is, but now this patch is changing that to 0. What was the
> >> reason for that change?
> >
> > It is described in the commit message: "Use 0 as Packet ID, as it was not
> > programmed earlier."
> >
>
> The part of using 0 as Packet ID is but not the behavior of changing the
> RMW which is also pretty significant. That was all happening under the hood.

No. It is explicitly mentioned in the commit message. It's not under the hood.

>
> >>
> >> This is true for all the APIs being touched in this file.
> >>
> >> I guess the whole point of having that audio map in the catalog was to
> >> preserve the read values of these registers. I have to check what was
> >> the reason behind that as once again this was before I worked on this
> >> driver as well.
> >>
> >> So technically there are two parts to this change:
> >>
> >> 1) dropping read for each header and directly just writing it
> >> 2) Writing the registers directly instead of going through catalog
> >>
> >> It seems like (1) and (2) are independent. I hope (1) was not the reason
> >> to have started this whole rework.
> >
> > Yes, the driver spends a lot of effort to preserve the data that will
> > be rewritten when the function is called to write the next header
> > byte. So it is useless. Only HB0 has been preserved, PacketID. If for
> > some reason we are generating a stream with the non-zero ID, it should
> > be explicit, not implicitly 'preserved'.
> >
>
> I am trying to understand why this was being preserved. Audio
> programming is half in DP driver and half in ADSP. I dont know if the
> expectation was that packet ID will be programmed elsewhere and not in
> HLOS code hence it was preserved.
>
> > So, the reasons were:
> > - fix the RMW cycles to drop old values from the registers
> > - use new msm_dp_utils_pack_sdp_header()
> > - get rid of the useless indirection through the catalog and enum
> > msm_dp_catalog_audio_header_type
> > - write registers in an efficient way.
> > - if we ever have a set of functions to handle DP infoframes (like we
> > do for HDMI), make the MSM DP driver ready to be converted to such
> > functions.
>
>
> The only reason the current driver needed to go through the catalog map
> was that it was trying to write one header at a time. And in the
> registers, 2 headers are mapped to one register. So a map was needed. I
> do not know the reason for breaking up the writes into one header at a
> time like I already mentioned so I am trying to gather that info.
> Without knowing the reason it might seem useless but its my duty to make
> sure nothing was overlooked.

Sure!

>
>
>
> >
> >>
> >>>
> >>>    static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x1;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x17;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = (0x0 | (0x11 << 2));
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x01,
> >>> +             .HB2 = 0x17,
> >>> +             .HB3 = 0x0 | (0x11 << 2),
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x84;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x1b;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = (0x0 | (0x11 << 2));
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     new_value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x84,
> >>> +             .HB2 = 0x1b,
> >>> +             .HB3 = 0x0 | (0x11 << 2),
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x05;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x0F;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = 0x0;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x05,
> >>> +             .HB2 = 0x0f,
> >>> +             .HB3 = 0x00,
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x06;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x0F;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x06,
> >>> +             .HB2 = 0x0f,
> >>> +             .HB3 = 0x00,
> >>> +     };
> >>> +     u32 header[2];
> >>> +     u32 reg;
> >>> +
> >>> +     /* XXX: is it necessary to preserve this field? */
> >>> +     reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> >>> +     sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
