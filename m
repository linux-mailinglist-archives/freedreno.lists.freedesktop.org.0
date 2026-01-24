Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA0POjQcdGn82AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 02:11:16 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F077BE37
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 02:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2470610EC1A;
	Sat, 24 Jan 2026 01:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqFiAPPo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5hOsuTP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A6410EC1A
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NF7ZUu1267799
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63D
 QQGCqs9c=; b=PqFiAPPoZCCB8o2szsfzdXeBjbo09PybAb6dWk+TvJeCrOx3azf
 aCeR/E+AOYmIw/PUGA5emZ5NuDO44SmfznkgmFI9AmfY+U47dlQqb0RPCOGo+7SB
 BOyDHQWRnIlquyKvQjBSZEeBuO5OaLEMzm1HeT2wm4zDPWxEkxxjLKYFMY6pYgEO
 h4syc2XckCxuFmpc/KLC0O0HLHTYza/5ZRXOU9qN+86+3AM6Kld8LRP39Nwtz/Qq
 DJoDGTJhT6oLa46K86m+D+nrtB8v3+Rem/ojFkIa5isSCgO9OlkuQXdBwrc5b3R/
 b98yGTs9H+19Ynj2sqINIkZyClbV4qAQRfg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv4v9b16c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:11:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-11b9786fb51so4620837c88.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 17:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769217072; cv=none;
 d=google.com; s=arc-20240605;
 b=DAr1wk0DXhU0inuQyMnDh0m56wBetviPs3KLsongVQH50PnTeWTAzQp/hqbyOGul+5
 mm1oAMfhhlTcFyzRwUD3uOfItwy/K5C9gycI/RL5CJ+d6O1dOpA5rh9IXqeb0SnlpUKi
 ex/Lj/mLxWBmOVivaoDV64tN2buIY2WAzSn1BKTSTXpgfoaSmvtQD0t5TWjRjEDoLJhS
 ixJS9lYZa2V9yxS42wxL7lbEzrFlOiI9hvZ+s7f2/qf0KO6x0+ZBFVG36SnUPC9rBU/N
 TemktxGfUi87VN5XRWl3PgRJXhghHBDHzgYJqf8rR3XRDODkDnc4gsGgVSdMVhz+ROPr
 gp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 fh=g5pnKebARIaaoy5yawT1QQ4zktjROEX/W5Z/52Dv900=;
 b=PqCygYIyNCuZeua7G6lHoRYmpEUADS1ZtVvaU7VnrUvDjTSqUgLnqGRK46Jg7B8XfL
 WGdwDiXlQsyRGsZmKxUf+hvx5qEGIljNA+e+aRhDVcQvA2mu2z4u6KrhpmsUBNxjhvFZ
 Ro9PEjQ/R1Vc7wljwDmlDMUjlokgF/gRzCwuCSV99BW/l6lb6hcDXxZK81SKu+yacXH7
 Ie7c/76X3wP1kocB3GvmsVWluq4Rmkq9m2cTKcSFvkkTiw0pBGNovhN4MoqCiXSJo3L4
 STvgZyUPycbaQigQ6VWef2G/EK1/QCGiwgONLgX2sD+NJT1OAYfMhuZpDuySFXQyWepn
 9FwA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769217072; x=1769821872;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 b=F5hOsuTPaNfVE19wqR5mUTrulJVK760aRIAIJw8zkpi2hrrOU8g5ZTxyQUspGSU/O9
 3NuXYlyK3szyj5OvIWoitOE+b9PW59dc9Cb3iUInPm71vO/NLjbIUNdnkNdJOFwXYWmV
 oR65lwB4Vj/h9Oy8rzhBCoQOjdccLBEhbbqzOdpwpObcF84rImHUQYLGDL+fS2V+QU5w
 ohGD5XZumzHuh3eV1IvRUTI5DE8ekr7DmlOsw2PICzlbNLfxBJAyNqaOXQqIkBB/ZLUN
 af6sdsTvLcmbl8shRJEWwWCnQVGT1DirIWLZq4/CCn9B91aA88+dPHN02VJ2EVpGW8+m
 yh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769217072; x=1769821872;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
 b=rLE0pIoUkJlwHYtOHvyKZXRppijlvv/MNy29qF6mawUQfQ1IJzf2dhWC3Co9L6X0YJ
 5cGLIEG3FvUGJqpZnAUvvDZVljGu7gPaIdo3j2auwfkKXnttHsfTLFcEXN8Ggu8QKNTt
 YukqCHsX2jE3y0A8BlSKPsI4qvdK6Ell+95eQybZInIC+oIqN771++98gxexWOCzYPGY
 dDwvKGDJmB6h+xPdldmwjWTSp7S+tRdVizNJp0HFSyZi89K0GTO/Lhli9vXU8/39VoUT
 EJcCFSJwzaMX4meQ3Qd6C1h5EoA6WtEV5rnKOidCI3YNdQ92ve8vU8v+peGIZC1t9Z1/
 AROA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUky8PRgERXSkFZ+AxUjXLB0tqV+IhAGPpBaeBrwiqXVN6JRsa27C56EWWEsrG7ttH6Oo+4PqmMY+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB7bbWqKOmo4itsaRcn0Rs5dZKgaVIclaRzXSSxgeft+oLHNeE
 eLqjehOhA0uwDuMGQZPKUKJKmCwlxIc9+ER47lNiW99GRN8W4d841Sj+rWbHPJn6+RjoC54JmYq
 hIAhYvjyUVFPLah+ZoWq7cZ683XThK2X3N5AJ62GXxX4cjuy5UMaJbfHM8/daI5JQ+Qcd/zaUcd
 5WbxT8ONDNbnywKL0dQoIbafAushYZqegEAmb1AtAl3YBgQw==
X-Gm-Gg: AZuq6aIp+WBYnhwEudky7PLIYIECQvfqRVsUqPngpV66YMtWhl5EVYwzoLTpWuRsxut
 I2WN7MDRykinnPdkb2TqmNU/GxmcwH9/7T/4IZdaLJ4VIiN77FbQhOgKIIPyHkPPhEv6KuRa2uh
 7V+KjXqOaket9FmYkWDJgG6mnqSwTzwUujhjCxd6fRzp3A1KQft08zoAKclcyvylUR5KQTKcqiZ
 OT2nb043kj540V+I7qaywubaw==
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-1247dbaf59amr2586255c88.4.1769217071802; 
 Fri, 23 Jan 2026 17:11:11 -0800 (PST)
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-1247dbaf59amr2586243c88.4.1769217071308; Fri, 23 Jan 2026
 17:11:11 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:10:59 -0800
X-Gm-Features: AZwV_QiAi8xrARX87HtwGvXJ3KtnTfbMYZbjGy5OdRX7_e-hsYCRCJbIWRy83PA
Message-ID: <CACSVV03A-GE5mNG1OLF3s9UCenQk4x3jO71Hmvr9j+vCF2hc7g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-01-23 for v6.19-rc7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: mo8Ceur-Bj0H1xYMLF5jkP8_BpxGjzls
X-Proofpoint-ORIG-GUID: mo8Ceur-Bj0H1xYMLF5jkP8_BpxGjzls
X-Authority-Analysis: v=2.4 cv=H7TWAuYi c=1 sm=1 tr=0 ts=69741c30 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=5xzA7AtM9dvb3DZk53oA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNyBTYWx0ZWRfX/1VGt/NIHkTS
 uiyA2K06LViLuaFDbAhvojWCOCC8nREMkcaegnUwj+bNE3B6G8WKle1jvOvLfqF+bK+ML8U/Ljq
 +GlANa2dHHqGvl/TYdUawG/61aSxffBhlPjCH7IhJLoutbSAczVuNCor3y9YNwY9nV7VID9n+kT
 zPBVwi5tbvtorZOlgg62/uJMn5To6vTmTdPQ1whl8AyXUfifGFqQEhUUI4kL07rflX3QEowVU2z
 PHbmmKP/gLvWIKb57qldHIVn5+9MIWN0GTVJy/lOMvFomi8YAwJuwo/K9Cv/j32Pvp6Zf1fwgKM
 Jh3Lj+yAK+kl/C4N+pDlz8tz/ET3x4dHq1Bdo4cQXSm9XEKync/gMLvp+Rf5nZn2weKfECyZT1Z
 1apJbP951f1gB6EgSbOuxYoXcwr1wq1cw82qPvPSCsbsgrn1ldJjr1sAGENcUKxWyJtjcYBB5sA
 8NkCqHnnbf8PFUbO6RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240007
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 61F077BE37
X-Rspamd-Action: no action

Hi Dave, Simona,

A late fix for v6.19-rc7.  Fixes a crash on A690.

The following changes since commit 66691e272e40c91305f1704695e0cb340cd162ff:

  drm/msm: Replace unsafe snprintf usage with scnprintf (2025-12-24
17:55:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-01-23

for you to fetch changes up to dedb897f11c5d7e32c0e0a0eff7cec23a8047167:

  drm/msm/a6xx: fix bogus hwcg register updates (2026-01-23 16:51:44 -0800)

----------------------------------------------------------------
Late fix for v6.19:

GPU:
- Fix bogus hwcg register update for a690

----------------------------------------------------------------
Johan Hovold (1):
      drm/msm/a6xx: fix bogus hwcg register updates

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
 1 file changed, 2 deletions(-)
