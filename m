Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DRKMnmygmn/YAMAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Feb 2026 03:44:09 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C52E0F41
	for <lists+freedreno@lfdr.de>; Wed, 04 Feb 2026 03:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD89210E1CE;
	Wed,  4 Feb 2026 02:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEKV3k8E";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWQR2xRf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945FC10E1CE
 for <freedreno@lists.freedesktop.org>; Wed,  4 Feb 2026 02:44:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613Im1Sw2055070
 for <freedreno@lists.freedesktop.org>; Wed, 4 Feb 2026 02:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=; b=nEKV3k8EyrtraurV
 VfjdOitMwTLB7Ikd/m37Zu8Mu7YnJ8AeAHf6DHRdkkGyfwMkNLnHfDRX7HcCgvem
 MMvOpmvzt7UgQvwtMFk+6Lgj0trDatcH2qV3aIO1ELEqAa5HVWunX4kCKUe82Omh
 w/OTD4+DG8ZgRMCdqmDhSooqV7ZbI6HAb9oEkebZX9pKhM2P4UAv6xLj8hbS67qY
 ADEmjbBa/F/0q1PH3GBreEfgoA0SrrWB4Ym3IcXXTPd+FMyelCBFTDjKDrmGwGpn
 n9arG4GpVg+6B6m3uK377ou1rJ4QQuB4InAVky0Yv2fMS4FFvZuYrLCWOEZv8ebA
 tVCSgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkb2nm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Feb 2026 02:44:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so15615116d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Feb 2026 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770173045; x=1770777845;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=;
 b=bWQR2xRfh4tV6AaIlFzAW4CpKaoZkqFiVKfiNUCFEvPG96QkQw+9zH1gxS0mZvrT/S
 AphzazOQzbPn2afJhz7+V5YWBi/c3lPLSGQdNH5acQ/8VLi8wQt5+zwbDkx926oDrOW7
 bdc/8VV9f3vRkuGeJoEOd3uz7ERyNQP9WaFJ7daDyHoNUP1z8ssSbLdPHR/BVxSI/nOM
 Mi2hIfe8sjXRDW/ILVXssr1Q5NXDq6maoYvVhiYKW8WvEbxjWU3+CmTjbI3/lLzIA0Lw
 Js8bjluKC5AJ561C7sRfiMkhBPFEtKYZ/2cI8pk/Tclu7nW00139iLy3CrAHaMh8SMNk
 jXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770173045; x=1770777845;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=;
 b=hiXiHObhmq/WgqQtagZ0g1Cro8p3U0vldIiMjEsXjv56FnXLcMCo6QboW30Uic8ClF
 KVat2tqm31NlWLUGMYRKbOZqxB8G7AUXHUlGkPd12lvlVyCR9S8pdZXJv5IzvnriupPg
 hpW8IFvC2H8FzV71siDP5kColQCMaAYr/hKBAx0a4BvSrXR7Jv7m3UOozVVx2xEazMIV
 F9MfTcCh0E4Mxb4f+Y4lH3OQe/nOleGrDcX1+h0v5+Frps3MfTTsWkGioSg3lvBKRPDK
 OVTp7HJ5VbEcD8YKlI8ZenOeTtKy54N/o/blBCm546GxDTy79HFWxDB7KlowKhwScfIe
 MExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlUI1qr9LpIj53DvGy01w1hSS85FLQ8PeDt3vlcAzzlfFfwpF4jIMQ8ZnQgD+1ar2a0+W3WlWnsPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF18DNUUbi7o6Azp0wndH6TH16Lx9f4a4pjbKX3ev0AqWJNwah
 eB0sToesf/ZOqbUpCgdaeBwcaOHa22KhiQulVXnBAUmvgG/zBqq0fQZzMGlBUXwGHmHje1E5oVy
 XZ4+w1YPJYQSkX0cWv3ogl+JatRuAHbWuHU9Uo32frzRz7vk/X5goFOWeA/dWPNib0p6T3JE=
X-Gm-Gg: AZuq6aJLL10LxyKNFfSuvbp6TOXzm7B6gTizI2q/GOR3mDmJcLUzAp766jAq5Ifutct
 mKeiX33kHhFy2B+vFGAputAy6hAWmG4bbmaBOcoilPiNDma95QunLHKhVY+HPu/89XH094IYKf8
 QZA6A4apDxlgdpVnqGiYQYNMJABt5J9ldOLX/sDptQ2zM7GBKAzpZikkZJDx86pglM+M6ztoEqA
 r4RckU6iMWYBpuWRHuT8LfYtLZ1RDtGuEKvUf0BiU+F001sBXAxig2NlIfjNJr20ACtS3AsU9AS
 fkehgEdYgdGfKd8SzzFkWDQAhBLX25vsgkMs2C7paE7Kb3hBMXkjlOuVOhB3QV0m5Od/O0rNaVZ
 5Ozz9OjMCjZGoz5ttxpAxjI+3hiEBS+UJljVD9J9m+Jet5lBwVGyCEbwwdoH5PsfPJ3uUXWe3xQ
 53Y55iDl/V22YR3T+v2ns+OM0=
X-Received: by 2002:a05:620a:40d1:b0:8a3:a42e:6e14 with SMTP id
 af79cd13be357-8ca203467admr597154885a.10.1770173044834; 
 Tue, 03 Feb 2026 18:44:04 -0800 (PST)
X-Received: by 2002:a05:620a:40d1:b0:8a3:a42e:6e14 with SMTP id
 af79cd13be357-8ca203467admr597153385a.10.1770173044314; 
 Tue, 03 Feb 2026 18:44:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3869207004esm2334061fa.48.2026.02.03.18.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 18:44:02 -0800 (PST)
Date: Wed, 4 Feb 2026 04:43:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
References: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
 <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
 <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNyBTYWx0ZWRfXwCXdoYbiexxU
 2vsHCRnIleND6oTAT6Medjj4vLa1uFmv7FqFhlQYe7hBZBnEi9czHMGa3E0tILvYNYsY0hEIVHn
 HMLqU1DSF82mk0AgnXwR6LoUw3+sgGVg7wNVM3O/JQb7joQYtrxQBUIQzjDMEtIPBVfxxkwdMVs
 n4w139xRNENAj6X1SwjlMVvzxtsszY/EbDcxLhTgMxfJL6sPa54M43f9XjmeWtoQcy2yRnfOHrj
 B49eZ486IENoFxG8oKcpaENSZga91Pkohw7DrCMo1SE3BhR71YJamZzHUvvhBpGSGjhX1y2AmZ2
 XY0Dby80G8p/JlzLmbYSZLssJiRr9Q0A0BtjEHYNQOdYeecdwINVl8E5ShMQymy1lK/+qkCmZB5
 pMJZSzZsFNk7v9HuekaJ1WENmNNRm8wYArgAnt5Vf1CxOyAP35XmyyRZa1fh0uc8aYhQdMPVfW7
 wxQEL+UHuUD+Y57JNiQ==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6982b275 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MF6XG58hdB1_LbVRQekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: VsDpZMFW-XJeluLHZplirnMQrJOcinEK
X-Proofpoint-GUID: VsDpZMFW-XJeluLHZplirnMQrJOcinEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040017
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 35C52E0F41
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:15:14PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月27日周二 03:06写道：
> >
> > On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 20:31写道：
> > > >
> > > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> > > > > >
> > > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > > > > > >>
> > > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > > > > > >>>>
> > > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > > > > > >>>>>>
> > > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > > > > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > > > > > >>>>>>> is called from the CRTC side to ensure the topology information from
> > > > > > >>>>>>> the CRTC check is available.
> > > > > > >>>>>>
> > > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > > >>>>>
> > > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > > >>>>>
> > > > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > > >>>>> engine starts without a valid memory address, which triggers
> > > > > > >>>>> an IOMMU warning.
> > > > > > >>>>
> > > > > > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > > > > > >>>> exactly know what is going on.
> > > > > > >>>
> > > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > > >>
> > > > > > >> Sadly enough the text below is not a significant improvement.
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > > > > > >>> during the plane check phase, so that a plane can be supported by
> > > > > > >>> multiple hardware pipe.
> > > > > > >>
> > > > > > >> What does this mean? Without virtual planes in place, there are no
> > > > > > >> multiple hardware pipes.
> > > > > > >>
> > > > > > >>> While pipe topology is decided in CRTC check.
> > > > > > >>
> > > > > > >> ?? What does it mean here?
> > > > > > >>
> > > > > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > > > > >>> framework. Without topology information from the CRTC, plane splitting
> > > > > > >>> cannot be properly executed.
> > > > > > >>
> > > > > > >> What does 'properly' mean here? How is it executed? What happens?
> > > > > > >>
> > > > > > >>> Consequently, the SSPP engine starts
> > > > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > > > >>
> > > > > > >> IOMMU faults. There are no "warnings".
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > > > > >>> is called from the CRTC side to ensure the topology information from
> > > > > > >>> the CRTC check is available.
> > > > > > >>
> > > > > > >>
> > > > > > > Thanks for the patience!
> > > > > > >
> > > > > > >
> > > > > > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > > > > > during the plane check phase. When virtual plane is enabled to support
> > > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > > > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > > > > >
> > > > > > number of pipes
> > > > > >
> > > > > > > decided in CRTC check per interface number, resolution and hardware
> > > > > > > feature.
> > > > > >
> > > > > > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > > > > > So how is it relevant?
> > > > >
> > > > > After revise of splitting plane into pipes, the number of pipes will be decided
> > > > > by CRTC check for both virtual plane and non-virtual plane case to unify the
> > > > > plane handling,  instead of assumption of 2 pipes at most.
> > > >
> > > > This needs to be explicitly written.
> > > >
> > > > > >
> > > > > > >
> > > > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > > > framework. Without topology information from the CRTC, plane splitting
> > > > > >
> > > > > > WHat is plane splitting?
> > > > >
> > > > > How about: s/plane splitting/splitting plane into pipes ?
> > > >
> > > > This plane is not being split into anything. It's being mapped onto hw
> > > > pipes. But before that, the number of necessary hw pipes is being determined
> > > > based on foo, bar an baz,
> > >
> > > Thanks for the correction!
> > >
> > > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > > allocation occur during the plane check phase. When virtual plane is
> > > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> > > be needed, so that a plane can be supported by 4 hardware pipes.
> > >
> > > After revise of quad-pipe, the number of pipes is decided in CRTC
> > > check per number of interfaces, resolution, clock rate constrain,
> >
> > Where?
> 
> The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
>  is made in later patch. So I drop this in this patch message below.

The pipe isn't decides in that function.

> >
> > > hardware feature and virtual plane enablement. The decidsion of
> >
> > decision
> >
> > > number of pipes will happen in CRTC check for both virtual plane and
> > > non-virtual plane case to unify the plane handling. Before that, the
> >
> > will? Do you mean, after this patch? If so, please use imperative
> > language. See Documentation/process/submitting-patches.rst
> 
> Yes, it is in later patch. So drop it in this patch message.
> 
> It is possible to keep plane check unchanged, and rely on re-allocation
> in later stage to support quad-pipe, if quad-pipe use case is detected.
> But to unify the allocation logic for both non-virtual and virtual plane
> use cases, and to centralize resource management, we'd better defer
> the allocation.

Which allocation? The non-virtual-planes case is more or less static.

> 
> 
> >
> > > the number of necessary hw pipes is being determined based on
> > > resolution and clock rate constrain.
> > >
> > > By default, the plane check occurs before the CRTC check in DRM
> > > framework. Without topology information from the CRTC, plane mapping
> > > will be skipped for the first time as number of pipe is 0.
> > > Consequently, the SSPP engine starts without a valid memory address,
> > > which triggers IOMMU fault.
> > >
> > > Defer above plane related operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > will be skipped for the first time as pipe number is 0. Consequently,
> > > > > > > the SSPP engine starts without a valid memory address, which triggers
> > > > > > > IOMMU fault.
> > > > > > >
> > > > > > > Defer above plane related operations until dpu_assign_plane_resources()
> > > > > > > is called from the CRTC side to ensure the topology information from
> > > > > > > the CRTC check is available.
> >
> How about this commit message? It is more coherent with the change
> in this patch.
> 
> 
> Currently, a plane maps to at most two hardware pipes, and SSPP
> allocation occurs during the plane check phase. However, when virtual
> planes are enabled, SSPP re-allocation can occur within
> dpu_assign_plane_resources() during the CRTC check.

There is no _allocation_ for non-virtual-plane case. The SSPP are
statically assigned to the planes.

> 
> To support future quad-pipe topologies, which require allocating two
> SSPPs with four rectangles by default, it is more efficient to perform
> the primary allocation in a single pass rather than relying on later
> re-allocations. So defer the allocation to CRTC check phase by default.
> Allocation logic for both non-virtual and virtual plane use cases is
> unified in this way.
> 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
