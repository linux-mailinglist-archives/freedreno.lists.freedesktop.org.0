Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAL5AFlsd2nCfQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 14:30:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1388D57
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 14:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2EC10E11B;
	Mon, 26 Jan 2026 13:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CfBPjVFw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3010E11B
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 13:29:57 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64938fce805so4130647d50.1
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 05:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434196; cv=none;
 d=google.com; s=arc-20240605;
 b=DxFrXpZDYcAjtZZUvB8RRdcY8dirZ90TJCeS8WMNN71skhPhW6j+B5xo4vv/9/ph04
 5+NmDfVMsi3/JARuchGKvEnixH6DCvBLcMmkPE4xa/TcArsXjc3Ad4mzZqAaFxOLDtm1
 a7jgL3Fz8A2DwkCM6TBTT/+96oqsMYQj5X5R4yUfwGVwUIqzYpSpkwyL6lOVKFZUH7z0
 f8ZUGaUK48xyVIZ2biyW148dp5ZO2NEejEaaGRHiyKBmi41jBUVbVmnABfP0riyJWv2w
 aGeEuywkrz2r/gjbPW/Z0NnOk8H4KPZDA+2H1ZexMiLNFto29LOZAdUa2+i+VNH5/OfC
 5qRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 fh=/uZBnEYkjZqQeszzZkda6MtUKN8Pm7bogcXJQyTvEhA=;
 b=ItHG+ugU2s/QLR3c4h4gztzscpFQIFCvWJcY18tG8qrOX1SC7xVSNlZ8FiahS6GDfT
 A+n4wiol69DaYWr5XsVj6KCUP6saLxqk/+Efjcvo72P+0ys4uCx4lktdb7C78mTov8cO
 mNOrgvlhCY53t5i0U/iAuxj4d3fi5l97e2AI3sCbGVByoILjfg/PZHsCymD93njJ4MXO
 1f6+H0JX1EyYI3CcVfybSm3+Ui48is8UqWlEy0ZXz2iuhUFTRuiivEKvilNSqLT1GlM1
 N5nLE1P5jrlL07eAlsIkWVOIy3UU+GHH6qc8yxM2r65IFy3ZznVcBLBloOX+05+FbACL
 Drfw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769434196; x=1770038996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 b=CfBPjVFw4F2p6tW2XFfqk31RrXuvg3dQDz8vs85QHqYl00EmZBYhoMmVxtRC0sSXQ1
 3qP3eK9e+buXO+krpGAdoDmHB1k81KPGKoY2XfOwDVdItd465R2gOhAi2wWrtH0QwfQu
 MRl5ugOVuCuTe+Zeya5TafDGeEfhnLOUpBoctB4UwQniQ348TwLR7BhfHVxkVkD2lwlX
 ths3LSZCsL+bfldT8QvmIMW41LRKv88oOqf1RLxOlM1gitekqAdOUYG0QuQrzb+7kOe7
 mkGWB4tBpbf80Lkj1pFuDOJHjXPsxUDniLQ+rU0Xiu7IhsNn7TrZ9MdyNVq5zNd0Ede/
 1stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769434196; x=1770038996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 b=hPjKiyYeJvNNUo+Kbzyob6TfC3EyOYQkah5h012TH93akfvivb1gFNoKPQiFAtiIFR
 bMioeLFZCpT0BzOP8AOPWu4q6glKhaLJpGTEd25GRzXMzM0h119D0+QpMMaLojZmDKlE
 tEIuyybE6VMcBerplj9eFw22GlAwuQXkYZdsZQ8in5UmNO3HQHSNYDIsO8uvFJhKq5vH
 Q1QNRaLCpzPT0HPah16od/ek1J3TgrwrkbM7Z+o/qjbOi8p/EFtwhaVW1WaLzm4/EcM2
 Tdh9k66nVcX/V+hBcWcW2gs4EOFo2qF0InpjjU78NT7LBhRZI2bW6llYwTsaOimem2/b
 r2DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1/td8aHJQUnmUm/sIJ7KcTN0sFPEscwDJhdpmQN0eAgcCYuG+Edpo+UM0saodpvpXBzNDbKW+kzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfqal8PA09WHS1Gbyn4KAJfeQvf3chfU9MInlaTG03gy4hZPE+
 7fBmr/IaHFJXNz/1FEoPc4a6GJoodxBEzJZnDekGG7uJeCEYXdrIL3z4D5Wqf6JlzDLlPuCJkAs
 ANqFIJXGhbQuo600C7j10zikgij0VPMRfwCFWKC80Qw==
X-Gm-Gg: AZuq6aIiHjlHLUa5BBA/K7YgUfeUPALzutEXjLzgGzZXAZvBB5AzpnD/O4F1UcKB6iZ
 317YEwHKCfu+z8cTWP+6m/jH+uoHmXjZd9pKzeNv39OheMscivYFSKC8d4wSP853fGOezYBvdLr
 +N0WCzVxuEldCMU/BWV5geBB+2aMyEUc2IH5lwS5dy9HDf+kqcvhrYMnYrrwhe/zgrkKylLudsV
 EgkgEAO8D848gMfVmc1VMVVP89QciN+OcXMyLAGzjS3i30FikqpqAA6PYmYX7IzuCE0ako0Fwv5
 aaQZqKhVKhSDNSXW
X-Received: by 2002:a53:ac89:0:b0:649:6074:9d3c with SMTP id
 956f58d0204a3-64970c9fdf9mr3532659d50.54.1769434196536; Mon, 26 Jan 2026
 05:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
In-Reply-To: <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 21:29:44 +0800
X-Gm-Features: AZwV_QhrhzX3QFcHeAIEwxeWZf4Y6oIwMBcL2-B9HiItZYabjyPzZqC41KwRdrs
Message-ID: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 69A1388D57
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=
=BC=9A
> > > >>
> > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E202=
6=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>
> > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>>>
> > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > >>>>>>> Currently, plane splitting and SSPP allocation occur during t=
he plane
> > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_re=
sources()
> > > >>>>>>> is called from the CRTC side to ensure the topology informati=
on from
> > > >>>>>>> the CRTC check is available.
> > > >>>>>>
> > > >>>>>> Why is it important? What is broken otherwise?
> > > >>>>>
> > > >>>>> I see. Thanks! Will add below lines in next version.
> > > >>>>>
> > > >>>>> By default, the plane check occurs before the CRTC check.
> > > >>>>> Without topology information from the CRTC, plane splitting
> > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > >>>>> engine starts without a valid memory address, which triggers
> > > >>>>> an IOMMU warning.
> > > >>>>
> > > >>>> What is plane splitting? Write commit message for somebody who d=
oesn't
> > > >>>> exactly know what is going on.
> > > >>>
> > > >>> Thanks for the suggestion! Any more revise is needed?
> > > >>
> > > >> Sadly enough the text below is not a significant improvement.
> > > >>
> > > >>>
> > > >>> Currently, splitting plane into SSPP rectangles the allocation oc=
cur
> > > >>> during the plane check phase, so that a plane can be supported by
> > > >>> multiple hardware pipe.
> > > >>
> > > >> What does this mean? Without virtual planes in place, there are no
> > > >> multiple hardware pipes.
> > > >>
> > > >>> While pipe topology is decided in CRTC check.
> > > >>
> > > >> ?? What does it mean here?
> > > >>
> > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > >>> framework. Without topology information from the CRTC, plane spli=
tting
> > > >>> cannot be properly executed.
> > > >>
> > > >> What does 'properly' mean here? How is it executed? What happens?
> > > >>
> > > >>> Consequently, the SSPP engine starts
> > > >>> without a valid memory address, which triggers IOMMU warning.
> > > >>
> > > >> IOMMU faults. There are no "warnings".
> > > >>
> > > >>>
> > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > >>> is called from the CRTC side to ensure the topology information f=
rom
> > > >>> the CRTC check is available.
> > > >>
> > > >>
> > > > Thanks for the patience!
> > > >
> > > >
> > > > Currently, splitting plane into SSPP rectangles and allocation occu=
r
> > > > during the plane check phase. When virtual plane is enabled to supp=
ort
> > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so th=
at
> > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > >
> > > number of pipes
> > >
> > > > decided in CRTC check per interface number, resolution and hardware
> > > > feature.
> > >
> > > Okay, but IOMMU errors were reported with virtual planes being disabl=
ed.
> > > So how is it relevant?
> >
> > After revise of splitting plane into pipes, the number of pipes will be=
 decided
> > by CRTC check for both virtual plane and non-virtual plane case to unif=
y the
> > plane handling,  instead of assumption of 2 pipes at most.
>
> This needs to be explicitly written.
>
> > >
> > > >
> > > > By default, the plane check occurs before the CRTC check in DRM
> > > > framework. Without topology information from the CRTC, plane splitt=
ing
> > >
> > > WHat is plane splitting?
> >
> > How about: s/plane splitting/splitting plane into pipes ?
>
> This plane is not being split into anything. It's being mapped onto hw
> pipes. But before that, the number of necessary hw pipes is being determi=
ned
> based on foo, bar an baz,

Thanks for the correction!

Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
allocation occur during the plane check phase. When virtual plane is
enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
be needed, so that a plane can be supported by 4 hardware pipes.

After revise of quad-pipe, the number of pipes is decided in CRTC
check per number of interfaces, resolution, clock rate constrain,
hardware feature and virtual plane enablement. The decidsion of
number of pipes will happen in CRTC check for both virtual plane and
non-virtual plane case to unify the plane handling. Before that, the
the number of necessary hw pipes is being determined based on
resolution and clock rate constrain.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane mapping
will be skipped for the first time as number of pipe is 0.
Consequently, the SSPP engine starts without a valid memory address,
which triggers IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

>
> >
> > >
> > > > will be skipped for the first time as pipe number is 0. Consequentl=
y,
> > > > the SSPP engine starts without a valid memory address, which trigge=
rs
> > > > IOMMU fault.
> > > >
> > > > Defer above plane related operations until dpu_assign_plane_resourc=
es()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > > >
> > > > Regards,
> > > > Jun
> > > >>
> > > >> --
> > > >> With best wishes
> > > >> Dmitry
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
