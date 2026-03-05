Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFCyDuOMqWl3/AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:02:11 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF384212F11
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7382910EC06;
	Thu,  5 Mar 2026 14:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PfWb550w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051F10E281;
 Thu,  5 Mar 2026 11:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEIWMv2wNWIWw7+FLyhyfK1u6rM/R67FkekLSUd95LdyYWhusJWVPnKgB9Oz/Iyo2/BEqtb01x/z84iHqkgVtzL3An1Qhr/naQZUQGCwe4QjYD3GQXFZJm4Pk3tdpMh8JIpzNREtUk0iT2kUk1VXXszVJR+Y1Hs57Ke3Rl1ovPEHhjd/1jKtnlcEVQ9oJX3TbZIC4CZheofT4fPl4kI93YZD24/9YrfXQakriULwAnvOs9L8esgdLb4sed8sjV8BqXoZLxjed0m3way99MbWWsMZOevJaCmp1JlnM2Hztsz9EVKa58sdKX/03ZAIrRTIpzbBQ0oOvHvwvXXZwDjCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGS3r3GlRi239YQY4rTO/s7jOKeO++EFBB+W9oAfSFg=;
 b=zRY1UEESsOk53/1xAn20HVLm/0CvB5SxuUBhgu4MSMXiHF93IE2mi9VtRt5w/IZzw8fP+iJxZPnSaL37FI8CZPkiQui8tT5ZohAMEouk3H6NwDbxYzcU1Ct6sD6qh0zDiHJCfiVh9zuJOoHzGK3VsgTk/lO3jxF77jQ/rpfYkBitfiOzEDFkWcFN3aAk3jQoUGYQf7ZoEa4K191gcX4HB3o7SfmP31X6V1KRbLcFq07SFVLII21oYbC4E1GYh9leqvEygLpwibOyNDJf24Rea2296Ff6k4336YuGOgFbcqswZ+Y+4b1QErwatSccZ7VvgQ3DK5wnWzqgAM9n4/oSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGS3r3GlRi239YQY4rTO/s7jOKeO++EFBB+W9oAfSFg=;
 b=PfWb550w8BIJTUF40ftI9/08+ky93qIfy3mcCbhrdSitIfMeZ/wipMq9xu2mfT8gacwKYtAhFQeL2dBU/3G04rBE5J8mDdOSW1VanCPMkYNVPN/1+BfT1T4EbjbdhCSbxscabSnPYNvbdMUt+POERSPwIXLQOjHzHwxdYzvrpLkN5jP1d16SbMF+Wo1dgHuTvdO0Pz/GtUIyTJ5NjtOanm/1lPzOgLXRiUz9ZNsEtBmr+MUzHExTKJywsUfZudKzmTSChMRKsSL4AFCpXdKciaIT0kr1eaO2LlZWDt4i19Awh06zHLqi7vqjwsMmRv+d/QpOsfg7bKyT9Uj/tl9Eug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DU4PR04MB12348.eurprd04.prod.outlook.com (2603:10a6:10:62c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 11:43:56 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:43:56 +0000
Date: Thu, 5 Mar 2026 13:43:52 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Joe Perches <joe@perches.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305114352.2f7btqixg4tu5bzl@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DU4PR04MB12348:EE_
X-MS-Office365-Filtering-Correlation-Id: bf133d4c-59e6-484a-ed90-08de7aac7be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|19092799006|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: JuxnoTb1Jada82oBzvt49PrZL0JJqfGIYJbbIaruvjNEhtvSMIfNcv6cQlD6psNNSg7IGSngt3EYq6YqICGHBbfsMeUnJCf4vjYk0Z22dHaIgWVz40wJ38NuqRWo5dOGwyVQWUM08FHZh+F5duSUAAcTphp+PR2UYL2RjXMOuCeBgM0hBIIInxHN6TclKxoPSck1XoFi23uEB8HRrEpm20MmectQc1XgbG5PlzwlBXkVSnOfh7KcUp/NoXuwlcUqx/9p6ffmLyK1yjBJ2z8dcDWefBN9HCr4cmYIu0I/ZfVjotjB9lVU8NmLqMuPqsBI6l46oE2bNvs/td29InaoC8tD7d7TyBl6wBjb0B8Yvw4DXjROIzKvRPlXhiHOXoUKR1vlJGnmrlJhEXqThpXQ/SdIyuphkTmxE15DydozlCxna6c8h9rZZPWuiTJd7y7lCv26V1iJVGuTduvvMv9LO48+rprS45iEDoqBYsxrW7pt0OvaBcTnHass5/LXi8ul4M9+3yNArZQBw+iRLssPJEB8sEQQrVwm75J3b1HfTyPgsZ8/oY5msCODEDwz6fDhQ1yPSLTbmx7nYH621fTm0k6lFzn3ufe/V6RuoDVpwQBWCl0XlK7P8TtuaFqQY3zcNe8CJsWOG4/fWG1B70OzfFIjELsX1GTJ7Wa2gq3srR/3OtUZAom/6MKZO8OuO7v/Y/9JaM1yJZgVCyxNIGEWOgD1EGR6gz408Kn6K4vTQdI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(19092799006)(366016)(1800799024)(376014)(7416014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEyqRTZiplAbPPW5ER+AVlgKqOMxEGgAO1qjRbG/Zuz+BheO9Z2Ibsso0dxV?=
 =?us-ascii?Q?E5eQnEPd/pAluqC8G33SDGYD+cmdnMxx0KiqnVn+iBWA0SND12TyPCWTMohL?=
 =?us-ascii?Q?UzjbdmfCte0PuVfnc3tzC47n/cRTvPBoOJrXg/YqpnCf/B01U/pgevPMtrZv?=
 =?us-ascii?Q?NE2wvU8IVLEKl02r3Q6fTBcFOMWlwndPQDpZIYiV7q3Za9DDPE9aOIOszdh4?=
 =?us-ascii?Q?JAieXP5dyZYqFJR3wRdzzUiTLcuBHFJ+13TcT+b/9PU4zNZP231nPgtAtZKP?=
 =?us-ascii?Q?oRbBxsTeAQ/cO1Oc7odlroHhnmd7uruWYoomPFl+21CLglQ0zmAZNRyuftZ2?=
 =?us-ascii?Q?la9qDUxzU7s7Wel7vKA9vJDqLrGbh5tjhw+aFBNAvKZX1E7nGYiljahKE6Z2?=
 =?us-ascii?Q?Aq5BBUpoaWl1/UVZiIVCO4Md4J10zRmw9/MNiIAnZSgET8/boTI3wqrENXUL?=
 =?us-ascii?Q?tVDpaHlckTUEAwXDsSzqYmkvuwWQq5gEmRd/DcdNUb4bDj7pxTz9tLu7ieWr?=
 =?us-ascii?Q?WT2JSHH2u9CGwo107tzH5sWTY8Omu1Zr6JTgOQvjFBI5i4sLYynWBx6/6tP3?=
 =?us-ascii?Q?JGqN1OvB2ls/7wd3WE2DksMXZwF4/qN3t4wkpWD/c6ZTLOxD5aPt5tUv8RGF?=
 =?us-ascii?Q?s//RQ/0DNOWi30r9kp+Ve+MUGBUsp7/5e13KCF+br5v14bgF9UChyXL+J3CY?=
 =?us-ascii?Q?pwpWALlNdXy+IE9Q31WsA3TKAZ357MBX31C4WGwODzazJFhNNWA2ye1pZjb1?=
 =?us-ascii?Q?kGlat+ipOhdUqrKcVfTLx7mGXFO085weTQMqlO6OrqDP0DIXiWzmsRJQ699w?=
 =?us-ascii?Q?OJBaIqUG/kN2OJ501Fp/T7NnhSqXPwOO/1HQrz9BRlrHhUk2owaKWilz9W+Y?=
 =?us-ascii?Q?WnR2WBw2zCtIohpxHSDzedQiQmMogTHJnjd+pnuXTLvgbyIXmkZMFO4B2o5q?=
 =?us-ascii?Q?uFxSdlvqNcSQ1x/fesxYoocbt6zj3rjkx9uPO4LarhXXO5uzRoZfUf7yh8tM?=
 =?us-ascii?Q?DtC3Ia0UA20xJ6B93RgjCqEJMUNgpkb+rUiZv6ITez4w9cuE5MuQrMMyrs9A?=
 =?us-ascii?Q?EcACt/zoqkxdDthcpW59kkhWMV9YRNLsuqaP6bu1q2a1/PnP6bezPIKaw0eq?=
 =?us-ascii?Q?OpspfvdMya5CVx8FYZSunb+QbLPMo19l6KPekJJcV3+htFEZ/Vp41pMamWmD?=
 =?us-ascii?Q?rnf/FzlkZfa6Bh+AMMvOyfaygBLtt3HoksL6ihK01+ci2s7oG63sZw4SW2Rr?=
 =?us-ascii?Q?yCXjz6zvciQlfmOO5NhlW/kgoRz8qhH4EQWmKXAW8qlXiTc5Nxjb9qDyhUrn?=
 =?us-ascii?Q?qrd6hvwZlVYFjH2de6SLNV/8LD6TOFcxiu/SZlatHcMnyXZcZcC9dgggbKI4?=
 =?us-ascii?Q?hBoOYiTQI3hJnr9IMzeGoeh1eZLw7UJH5jHTU2ICLnUpqE9QRhYV6nF9GVE9?=
 =?us-ascii?Q?XGgxkhJ3bFxUXjgmb5Y9nXzfdFwZhfH2cgfDCsA1MozUpOvZkhGMqAh32vk7?=
 =?us-ascii?Q?u6Y+e5xIDpq1n/fJZz7dybXRjWnvPiUQ0bXK1+H61KjrVpBz+B5lH24lV+t2?=
 =?us-ascii?Q?/Yc+pFG0YtHV2w2kxBcbdYR3en+G8NV/jDNHzXtEt3s/myAy6kZN50okojo8?=
 =?us-ascii?Q?bHJmCJB8oRBxVFNvkBTfjMsjkLHrCietWQDJUZEGCr3R0Wvv8mMiea7EYSTG?=
 =?us-ascii?Q?N1PsfHUrz6/rQnQc4ND4x9My/mJmen2tdMudbU4EmMkLUwFzd+ewG9NHJyqa?=
 =?us-ascii?Q?56AGjd3ztdHwjSypvlNX46fJRG8jKEo4l6WmeI9ajBBEO/T/3Wo1QXYaSskE?=
X-MS-Exchange-AntiSpam-MessageData-1: 5KbcQYK56ar6KYw2fdjoYeMZswgIzy+j+jo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf133d4c-59e6-484a-ed90-08de7aac7be2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:43:56.6486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvtJ9tYfH2QuXfs69JzcXq2dkv+lV43Qg+NduLtI9615guCA9ILujQzljqpm7vpGLO79RmYfmXmkgYMU1dbcfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12348
X-Mailman-Approved-At: Thu, 05 Mar 2026 14:02:00 +0000
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
X-Rspamd-Queue-Id: CF384212F11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:30:40AM -0800, Joe Perches wrote:
> On Thu, 2026-03-05 at 10:51 +0200, Vladimir Oltean wrote:
> > On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 55af015174a5..bdfa47d9c774 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
> > > >  F:   drivers/phy/
> > > >  F:   include/dt-bindings/phy/
> > > >  F:   include/linux/phy/
> > > > +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
> 
> You could use multiple K: entries instead of this monster.
> 
> And please use (?:<foo>) to avoid capture groups too.

Thanks, I wasn't aware of either of those.

I am now working with this:

K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
K:	\bphy_(?:create|remove)_lookup\b
K:	\bphy_(?:get|set)?_drvdata\b
K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
K:	\bphy_(?:init|exit|power_(?:on|off))\b
K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
K:	\bphy_(?:reset|configure|validate|calibrate)\b
K:	\bphy_notify_(?:connect|disconnect|state)\b
K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
